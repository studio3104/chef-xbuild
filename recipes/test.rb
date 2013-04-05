=begin
xbuild_perl 'install test perl 5.16.3' do
  version '5.16.3'
  prefix '/usr/local/bin/perl-5.16.3'
end
=end

xbuild_ruby 'install test ruby 1.9.3-p392' do
  version '1.9.3-p392'
  prefix '/usr/local/bin/ruby-1.9.3'
end

xbuild_php 'install test php 5.5snapshot' do
  version '5.5snapshot'
  options '--with-pear'
  prefix '/usr/local/bin/php-5.5snapshot'
end

xbuild_node 'install test node v0.10.1' do
  version 'v0.10.1'
  prefix '/usr/local/bin/node-0.10.1'
end

=begin
%w{
  Acme::AjiFry
  Acme::PrettyCure
  Proclet
}.each do |module_name|
  xbuild_cpanm module_name do
    options '--force --verbose'
    perl_root '/usr/local/bin/perl-5.16.3'
  end
end
=end

%w{
  fluentd
  serverspec
  vagrant
}.each do |module_name|
  xbuild_gem module_name do
    options '--no-rdoc --no-ri'
    ruby_root '/usr/local/bin/ruby-1.9.3'
  end
end
