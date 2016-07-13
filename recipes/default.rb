#
# Cookbook Name:: sysdig
# Recipe:: default
#
# Copyright 2014 - 2016, Jim Rosser
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

case node['sysdig']['install_method']
when 'binary'
  case node['platform_family']
  when 'rhel', 'fedora'
    if node['platform_family'] == 'rhel'
      include_recipe 'yum-epel'
    end

    yum_repository 'sysdig' do
      description 'Official sysdig repository'
      baseurl node['sysdig']['yum']['base_url']
      gpgkey node['sysdig']['yum']['gpg_key']
      action :create
    end
  when 'debian'
    apt_repository 'sysdig' do
      uri node['sysdig'['apt']['uri']
      components node['sysdig'['apt']['components']
      key node ['sysdig'['apt']['key']
      not_if "apt-key list | grep -i #{node['sysdig']['apt']['key_id']}"
    end
  else
    Chef::Log.error("this distro is not supported")
  end
  package 'sysdig' do
    version node['sysdig']['version']
    action :install
  end
else
  Chef::Log.error("method #{node['sysdig']['install_method']} not supported")
end
