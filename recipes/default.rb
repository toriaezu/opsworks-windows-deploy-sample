log "OpsWorks Windows Application Sample"

windows_feature "IIS-WebServerRole" do
  action :install
end

file "c:/inetpub/wwwroot/iisstart.htm" do
  action :delete
end


