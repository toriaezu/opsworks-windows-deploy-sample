log "OpsWorks Windows Application Sample with nasty node #{node["ぱんつさま"]}"

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

service 'w3svc' do
  action [:start, :enable]
end


