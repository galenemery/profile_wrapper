#
# Cookbook:: profile_wrapper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory "#{Chef::Config[:file_cache_path]}/#{node['profile_wrapper']['profile_name']}/controls" do
  recursive true
  action :create
end

template "#{Chef::Config[:file_cache_path]}/#{node['profile_wrapper']['profile_name']}/inspec.yml" do
  source 'inspec.yml.erb'
  variables(profile_wrapper: node['profile_wrapper'])
end

template "#{Chef::Config[:file_cache_path]}/#{node['profile_wrapper']['profile_name']}/controls/controls.rb" do
  source 'controls.rb.erb'
  variables(base_profile: node['profile_wrapper']['base_profile'],
    controls: node['profile_wrapper']['waived_controls'],
    skip_controls: node['profile_wrapper']['skipped_controls'])
end

