import os
import re
import sys
import time
import json
import errno
import random
import pprint
import decimal
import logging
import datetime
import functools
import itertools
import subprocess
import collections

utcnow = datetime.datetime.utcnow

def ago(**kwargs):
    return utcnow() - datetime.timedelta(**kwargs)

def future(**kwargs):
    return utcnow() + datetime.timedelta(**kwargs)

u = None

def load():
    from django.db import models, transaction, connection, connections
    from django.conf import settings
    from django.http import HttpRequest
    from django.db.models import Q
    from django.core.files import File
    from django.core.cache import cache
    from django.contrib.auth import get_user_model
    from django.core.files.base import ContentFile
    from django.urls import reverse, resolve
    from django.core.files.storage import default_storage
    from django.core.exceptions import AppRegistryNotReady

    try:
        User = get_user_model()
    except AppRegistryNotReady:
        return

    def _u(val):
        if not isinstance(val, str):
            return User.objects.get(pk=val)

        if '@' in val:
            return User.objects.get(email=val)

        if 'username' in [x.attname for x in User._meta.fields]:
            return User.objects.get(username=val)

        raise User.DoesNotExist()
    u = _u

    try:
        from django.utils.lru_cache import lru_cache
        u = lru_cache()(u)
    except ImportError:
        from django.utils.functional import memoize
        u = memoize(u, {}, 1)

    try:
        from django.apps import apps
        get_models = apps.get_models
    except ImportError:
        get_models = models.get_models

    for model in get_models():
        globals()['%s_%s' % (model._meta.app_label, model._meta.object_name)] = model
        del model

    cursor = connection.cursor()

    try:
        try:
            user = u('dan')
        except User.DoesNotExist:
            user = u('dan@danpalmer.me')

        locals()['dan'] = user

        request = HttpRequest()
        request.user = user
    except User.DoesNotExist:
        pass

    superusers = User.objects.filter(is_superuser=True)

    User.__unicode__ = lambda self: u"%s (pk=%d, username='%s', email='%s')" % (
        self.get_full_name() or '(unknown)',
        self.pk,
        getattr(self, 'username', '(unknown)'),
        self.email,
    )

    # Avoid having to print or otherwise str() a Query
    models.sql.query.Query.__repr__ = lambda self: str(self)

if 'DJANGO_SETTINGS_MODULE' in os.environ:
    load()
