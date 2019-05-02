#
# Cookbook:: create-new-file
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

directory 'C:/chefoutput' do
	action :create
end

file 'C:/chefoutput/hello.txt' do
	action :delete
end



copying remote file
remote_file 'C:\Sublime Text 1.4 Setup.exe' do
    source 'https://www.sublimetext.com/Sublime%20Text%201.4%20Setup.exe'
    action :create
end

# installing sublime editor package
windows_package 'Sublime Text 1.4' do
  action :install
  source 'C:\Sublime Text 1.4 Setup.exe'
end

# setting firewall rules
#windows_firewall_rule 'https' do
 #   local_port '443'
  #  protocol 'TCP'
   # action :create
#end