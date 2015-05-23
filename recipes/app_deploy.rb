app = search(:aws_opsworks_app, "deploy:true").first

git app[:attributes][:document_root] do
  repository app[:app_source][:url] 
  action :sync
end
