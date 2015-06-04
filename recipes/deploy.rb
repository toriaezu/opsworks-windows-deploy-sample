app = search(:aws_opsworks_app, "deploy:true").first

git app[:attributes][:document_root] do
  repository app[:app_source][:url] 
  action :sync
end

dsc_resource "Test DSC" do
  resource :file
  property :ensure, "Present"
  property :type, "Directory"
  property :destinationpath, "c:/sometest"
  action :set
end
