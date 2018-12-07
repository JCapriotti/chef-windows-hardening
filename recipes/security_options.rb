registry_key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'NoConnectedUser',
    type: :dword,
    data: 3
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'SCENoApplyLegacyAuditPolicy',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'DontDisplayLastUserName',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'InactivityTimeoutSecs',
    type: :dword,
    data: 900
  }]
  action :create
end

registry_key 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'ScRemoveOption',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' do
  values [{
    name: 'RequireSecuritySignature',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'RequireSecuritySignature',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'EnableSecuritySignature',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'SMBServerNameHardeningLevel',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'RestrictRemoteSam',
    type: :string,
    data: 'O:BAG:BAD:(A;;RC;;;BA)'
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'NullSessionShares',
    type: :multi_string,
    data: ['']
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'UseMachineId',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0' do
  values [{
    name: 'AllowNullSessionFallback',
    type: :dword,
    data: 0
  }]
  action :create
end

registry_key 'HKLM\System\CurrentControlSet\Control\Lsa\pku2u' do
  values [{
    name: 'AllowOnlineID',
    type: :dword,
    data: 0
  }]
  action :create
end

registry_key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters' do
  values [{
    name: 'SupportedEncryptionTypes',
    type: :dword,
    data: 2147483640
  }]
  recursive true
  action    :create
end

