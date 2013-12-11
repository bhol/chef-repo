# chef-repo/cookbooks/apache/recipes/default.rb
#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Apache installed
package "apache2" do
	action :install
end

# Apache running
service "apache2" do
	action [:start, :enable]
end

# Home page created
cookbook_file "/var/www/index.html" do
	source "index.html"
	mode "0644"
end
