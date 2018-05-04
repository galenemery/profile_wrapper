#
# Cookbook:: profile_wrapper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# node.default['profile_wrapper']['base_profile'] = 'disa_stig-el7'
# node.default['profile_wrapper']['base_profile_path'] = 'CiQwMzNkYjMzYS1iZDcwLTQwNjktYTRiNi0zYTVlYzEyMTdiOTcSBWxvY2Fs/disa_stig-el7'

directory "#{Chef::Config[:file_cache_path]}/#{node['profile_wrapper']['profile_name']}/controls" do
  recursive true
  action :create
end

template "#{Chef::Config[:file_cache_path]}/#{node['profile_wrapper']['profile_name']}/inspec.yml" do
  source 'inspec.yml.erb'
  variables(profile_wrapper: node['profile_wrapper'])

  # variables(profile_name: node['profile_wrapper']['profile_name'],
  #   base_profile: node['profile_wrapper']['base_profile'],
  #   base_profile_path: node['profile_wrapper']['base_profile_path'],
  #   path_type: node['profile_wrapper']['path_type']
  #     )
end

template "#{Chef::Config[:file_cache_path]}/#{node['profile_wrapper']['profile_name']}/controls/controls.rb" do
  source 'controls.rb.erb'
  variables(base_profile: node['profile_wrapper']['base_profile'],
    controls: node['profile_wrapper']['waived_controls'],
    skip_controls: node['profile_wrapper']['skipped_controls'])
end

