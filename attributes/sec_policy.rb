# General security policy settings
default['security_policy']['template']['location'] = 'C:\Windows\security\templates'
default['security_policy']['database']['location'] = 'C:\Windows\security\database'
default['security_policy']['database']['name'] = 'hardening.sdb'

# System access settings
# Nil value means nothing will be written to the security policy template.
default['security_policy']['access']['PasswordComplexity'] = 1
default['security_policy']['access']['LockoutBadCount'] = 3
default['security_policy']['access']['ResetLockoutCount'] = 15
default['security_policy']['access']['LockoutDuration'] = 15

sid_no_one              = '*S-1-0-0'
sid_authenticated_users = '*S-1-5-11'
sid_administrators      = '*S-1-5-32-544'
sid_users               = '*S-1-5-32-545'
sid_guests              = '*S-1-5-32-546'

# Security policy rights / privileges settings.
default['security_policy']['rights']['SeRemoteInteractiveLogonRight']       = sid_administrators
default['security_policy']['rights']['SeTcbPrivilege']                      = sid_no_one
default['security_policy']['rights']['SeMachineAccountPrivilege']           = sid_administrators
default['security_policy']['rights']['SeTrustedCredManAccessPrivilege']     = sid_no_one
default['security_policy']['rights']['SeNetworkLogonRight']                 = "#{sid_administrators},#{sid_authenticated_users}"

default['security_policy']['rights']['SeInteractiveLogonRight']             = sid_administrators
default['security_policy']['rights']['SeBackupPrivilege']                   = sid_administrators
default['security_policy']['rights']['SeDenyBatchLogonRight']               = sid_guests
default['security_policy']['rights']['SeDenyServiceLogonRight']             = sid_guests
default['security_policy']['rights']['SeDenyInteractiveLogonRight']         = sid_guests
default['security_policy']['rights']['SeRestorePrivilege']                  = sid_administrators
default['security_policy']['rights']['SeShutdownPrivilege']                 = "#{sid_administrators},#{sid_users}"
