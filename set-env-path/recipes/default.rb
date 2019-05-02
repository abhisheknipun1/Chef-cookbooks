#
# Cookbook:: set-env-path
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

windows_path 'C:\Program Files\Git\cmd' do
  path 'C:\Program Files\Git\cmd' # default value: 'name' unless specified
  action :add # defaults to :add if not specified
end
