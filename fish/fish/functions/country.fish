function country
  printf "\
from styleme.account.models import TrialData
TrialData.objects.filter(pk=88625).update(country='$argv')
print(\"Updated to '$argv'\")
" | styleme/manage.py shell
end
