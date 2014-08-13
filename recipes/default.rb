#
# Cookbook Name:: weblogic
# Recipe:: default
#
# Copyright (C) 2014 Christos Kapasakalidis
#
# All rights reserved
#

unless ::Dir.exists?("/home/vagrant/bea")
  # Install Java
  include_recipe 'java'

  remote_file "/home/vagrant/weblogic-installer.zip" do
    source node['weblogic']['remote_installation_file']
    owner "vagrant"
    group "vagrant"
    checksum "d811df7ae7852f70f59bb2ef8bf313358918bcaf33dc824e67471eb849a866ba"
    action :create
  end

  # Install unzip
  yum_package "unzip" do
    action :install
  end

  execute "unzip weblogic zip" do
    cwd "/home/vagrant"
    user "vagrant"
    command "unzip -o /home/vagrant/weblogic-installer.zip -d /home/vagrant/weblogic-installer"
    not_if { ::Dir.exists?("/home/vagrant/weblogic-installer")}
  end

  template "/home/vagrant/silent.xml" do
    source "silent.xml.erb"
    mode 0660
    owner "vagrant"
    group "vagrant"
  end

  execute "install weblogic" do
    cwd "/home/vagrant/weblogic-installer"
    user "vagrant"
    command "java -jar server103_generic.jar -mode=silent -silent_xml=/home/vagrant/silent.xml"
    not_if { ::Dir.exists?("/home/vagrant/bea")}
  end

  # Delete unneeded file and directory
  directory "/home/vagrant/weblogic-installer" do
    recursive true
    action :delete
  end

  file "/home/vagrant/weblogic-installer.zip" do
    action :delete
  end

end