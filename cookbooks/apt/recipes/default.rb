# chef-repo/cookbooks/apache/recipes/default.rb
#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# run sudo apt-get update
execute "apt-get_update" do
  command "sudo apt-get update"
  action :run
end

