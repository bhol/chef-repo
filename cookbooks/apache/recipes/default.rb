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

# disable the default apache site
execute "a2dissite default" do
  notifies :restart, "service[apache2]"
  only_if do
    File.symlink?("/etc/apache2/sites-enabled/000-default")
  end
end

# loop pover the apache site
node['apache']['sites'].each do |site_name, site_data|
  # setup a document root
  document_root = "/srv/apache/#{site_name}"

  # write virtual host definition
  template "/etc/apache2/sites-available/#{site_name}" do
    source "custom.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => site_data['port']
    )
    notifies :restart, "service[apache2]"
  end
  
  # enable the virtual host
  execute "a2ensite #{site_name}" do
    not_if do
      File.symlink?("/etc/apache2/sites-enabled/#{site_name}")
    end
    notifies :restart, "service[apache2]"
  end
  
  # create the document root
  directory document_root do
    mode "0755"
    recursive true # mkdir -p
  end
  
  # write the homepage
  template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0644"
    variables(
      :site_name => site_name,
      :port => site_data['port']
    )
  end
end