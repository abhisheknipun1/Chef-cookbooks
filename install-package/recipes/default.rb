#
# Cookbook:: install-package
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


# creating directory
directory 'C:\cookbooks\install-package\output' do
	action :create
end

# creating file with content
file 'C:\cookbooks\install-package\output\hello.txt' do
	content 'Hello, world!'
end

windows_firewall_rule 'http' do
    local_port '80'
    protocol 'TCP'
    action :create
end
  
# setting firewall rules
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

# installing sublime editor package
windows_package 'Sublime Text 1.4' do
  action :install
  source 'C:\Sublime Text 1.4 Setup.exe'
end

# installing Git package
#windows_package 'Git version 2.21.0' do
 # action :install
  #source 'C:\Users\INE12362509\Downloads\Git-2.21.0-64-bit.exe'
#end


#powershell_script 'Install IIS' do
#  code <<-EOH
#  Import-Module ServerManager
#  Add-WindowsFeature Web-Server
#  EOH
#  guard_interpreter :powershell_script
#  not_if '(Get-WindowsFeature -Name Web-Server).Installed'
#end