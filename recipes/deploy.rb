app = search(:aws_opsworks_app, "deploy:true").first

git app[:attributes][:document_root] do
  repository app[:app_source][:url] 
  action :sync
end

powershell_script "Directory" do
  code <<-EOH
    Configuration OutputDirectory {
      File "App Directory" {
        Ensure = "Present"
        Type = "Directory"
        DestinationPath = "c:/sometest"
      }
    }
    OutputDirectory -Force -OutputPath $env:TEMP
    Start-DscConfiguration -Path OutputDirectory -Wait -Force -Verbose
  EOH
end
