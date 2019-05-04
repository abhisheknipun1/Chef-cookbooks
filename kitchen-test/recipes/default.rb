#
# Cookbook:: kitchen-test
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# creating directory
directory 'C:\Chef-output' do
	action :create
end


file 'C:\Chef-output\demo.txt' do
	content "This is maintained by Chef!!"
end

# creating remote file
#remote_file 'C:\Chef-output\index.html' do
#  source 'https://github.com/PixelsCommander/Download-File-JS/blob/master/example/index.html'
#  action :create
#end

# Removing file
file 'C:\demo.txt' do
	action :delete
end

file 'C:\index.html' do
	action :delete
end

# setting windows firewall rules
windows_firewall_rule 'http' do
	rule_name 'http 80'
    local_port '80'
    protocol 'TCP'
    action :create
end

windows_firewall_rule 'http' do
    local_port '80'
    protocol 'TCP'
    action :create
	direction :outbound #outbound rule
	firewall_action :allow
end
  

windows_firewall_rule 'https' do
    local_port '443'
    protocol 'TCP'
    action :create
end

#copying remote file
remote_file 'C:\Sublime Text 1.4 Setup.exe' do
    source 'https://www.sublimetext.com/Sublime%20Text%201.4%20Setup.exe'
    action :create
end

remote_file 'C:\Git-2.21.0-64-bit.exe' do
	source 'https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/Git-2.21.0-64-bit.exe'
	action :create
end

# Removing old Git package
windows_package 'Git version 2.5.3' do
  action :remove
end

# installing package
windows_package 'Git version 2.21.0' do
  action :install
  source 'C:\Git-2.21.0-64-bit.exe'
end

windows_package 'Sublime Text 1.4' do
  action :install
  source 'C:\Sublime Text 1.4 Setup.exe'
end


=begin # Block by Tesco to access this web page

windows_package '7-Zip 15.14' do
  action :install
  source 'https://www.7-zip.org/a/7z1514.msi'
end


 
# install 7zip and add path
seven_zip_tool '7z 15.14 install' do
  action    [:install, :add_to_path]
  package   '7-Zip 15.14'
  path      'C:\7z'
  source    'http://www.7-zip.org/a/7z1514.msi'
  checksum  'eaf58e29941d8ca95045946949d75d9b5455fac167df979a7f8e4a6bf2d39680'
end

=end

# setting env path

windows_path 'C:\Program Files\Git\cmd' do
  path 'C:\Program Files\Git\cmd' # default value: 'name' unless specified
  action :add # defaults to :add if not specified
end

# setting git env path using other cookbook - set-env-path

#include_recipe 'set-env-path::default'

# Removing package
windows_package 'Sublime Text 1.4' do
  action :remove
  source 'C:\Sublime Text 1.4 Setup.exe'
end

# Zipping the folder
windows_zipfile 'c:/Chef-output.zip' do
  source 'c:/Chef-output'
  action :zip
end

# Zipping the folder
windows_zipfile 'c:/Chef-output-unzip' do
  source 'c:/Chef-output.zip'
  action :unzip
end

# running apache httpd service on windows

remote_file 'C:\httpd-2.4.39-o102r-x64-vc14.zip' do
	source 'https://www.apachehaus.com/downloads/httpd-2.4.39-o102r-x64-vc14.zip'
	action :create
end

windows_zipfile 'C:\httpd-unzip' do
  source 'C:\httpd-2.4.39-o102r-x64-vc14.zip'
  action :unzip
end

template 'C:\script.bat' do
  source 'kitchen-test.erb'
end

=begin

file 'C:\script.bat' do
	content "C:\n
	cd C:\httpd-unzip\Apache24\bin\n
	httpd.exe -k install -n 'apache_httpd'\n
	httpd.exe -k start -n 'apache_httpd'\n"
end

=end

windows_service 'apache_httpd' do
	action :create
	notifies :run, 'batch[run-script]', :immediately
end

windows_service 'apache_httpd' do
	action :start
end

batch 'run-script' do
   code 'script.bat'
   action :nothing
end
