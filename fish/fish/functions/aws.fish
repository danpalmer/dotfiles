function aws-shell-session
  # Make sure we can run this even inside an already logged in shell.
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN AWS_VAULT
  profile="${1:?Specify profile to use}"  # Exit early
  AWS_ASSUME_ROLE_TTL=1h aws_env=$(aws-vault exec "$profile" -- env | grep AWS_ | awk '{ print "export "$1; }')
  eval "$aws_env"
end
