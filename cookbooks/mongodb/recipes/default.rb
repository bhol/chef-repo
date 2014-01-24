#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "mongodb package consistency" do
	command "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
end

execute "create list file" do
  command "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list"
end

execute "apt update" do
  command "sudo apt-get update"
end

package "mongodb-10gen" do
	action :install
end

execute "mongodb package consistency" do
  command "sudo service mongodb start"
end