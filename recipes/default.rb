#
# Cookbook Name:: weblogic
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install Java
include_recipe 'java'

remote_file "/home/vagrant/V13672-01.zip" do
  source node['weblogic']['remote_installation_file']
  owner "vagrant"
  group "vagrant"
  checksum "d811df7ae7852f70f59bb2ef8bf313358918bcaf33dc824e67471eb849a866ba"
  action :create
end

yum_package "unzip" do
  action :install
end

execute "unzip weblogic zip" do
  cwd "/home/vagrant"
  user "vagrant"
  command "unzip -o /home/vagrant/V13672-01.zip -d /home/vagrant/V13672-01"
end

template "/home/vagrant/silent.xml" do
  source "silent.xml.erb"
  mode 0660
  owner "vagrant"
  group "vagrant"
end

execute "install weblogic" do
  cwd "/home/vagrant/V13672-01"
  user "vagrant"
  command "java -jar server103_generic.jar -mode=silent -silent_xml=/home/vagrant/silent.xml"
end

