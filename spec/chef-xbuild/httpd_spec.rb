require 'spec_helper'

default = {}
require '/Users/JP11546/Documents/chef/xbuild/site-cookbooks/perl-build/attributes/default.rb'


describe '/usr/local/bin/ruby-1.9.3/bin/gem' do
  it { should be_mode 755 }
end


describe '/etc/httpd/conf/httpd.conf' do
  it { should contain 'ServerName' }
end








__END__
describe 'rake' do
#  it { should be_installed_by_gem }
  it { should be_installed_by_gem '/usr/local/bin/ruby-1.9.3/bin/gem' }
end
__END__
describe 'httpd' do
  it { should be_installed }
  it { should be_enabled   }
  it { should be_running   }
end

describe 'port 80' do
  it { should be_listening }
end

describe '/etc/httpd/conf/httpd.conf' do
  it { should be_file }
  it { should contain "ServerName chef-xbuild" }
end
