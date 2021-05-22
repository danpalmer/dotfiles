function aws-shell-session
  set --erase AWS_ACCESS_KEY_ID
  set --erase AWS_SECRET_ACCESS_KEY
  set --erase AWS_SESSION_TOKEN
  set --erase AWS_SECURITY_TOKEN
  set --erase AWS_VAULT
  set AWS_ASSUME_ROLE_TTL "1h"
  aws-vault exec "$argv" -- env | grep AWS_ | awk '{ split($1, x, "="); print "set -gx " x[1] " " x[2]; }' | source
end
