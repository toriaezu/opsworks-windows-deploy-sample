app = search(:aws_opsworks_app, "deploy:true").first

git app[:attributes][:document_root] do
  repository app[:app_source][:url] 
  action :sync
end

powershell_script "Directory" do
  code <<-EOH
    Configuration AppDirectory {
      File "App Directory" {
        Ensure = "Present"
        Type = "Directory"
        DestinationPath = "c:/sometest"
      }
    }
    AppDirectory -Force -OutputPath "$env:TEMP/AppDirectory"
    Start-DscConfiguration -Path "$env:TEMP/AppDirectory" -Wait -Force -Verbose
  EOH
end
