

# 2.3.1.2 (L1) Ensure 'Accounts: Block Microsoft accounts' is set to 'Users can't add or log on with Microsoft accounts'
registry_key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'NoConnectedUser',
    type: :dword,
    data: 3
  }]
  action :create
end
