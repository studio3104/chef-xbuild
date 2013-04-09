#
# Cookbook Name:: xbuild_attributes
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set[:perl][:version] = '5.16.3'
node.set[:perl][:prefix] = '/usr/local/bin/perl-5.16.3'

node.set[:ruby][:version] = '1.9.3-p392'
node.set[:ruby][:prefix] = '/usr/local/bin/ruby-1.9.3'

node.set[:php][:version] = '5.5snapshot'
node.set[:php][:prefix] = '/usr/local/bin/php-5.5snapshot'
node.set[:php][:options] = '--with-pear'

node.set[:python][:version] = '2.7.3'
node.set[:python][:prefix] = '/usr/local/bin/python-2.7.3'

node.set[:node][:version] = 'v0.10.1'
node.set[:node][:prefix] = '/usr/local/bin/node-0.10.1'
