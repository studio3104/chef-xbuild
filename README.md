# xbuild cookbook

Chef cookbook for [xbuild](https://github.com/tagomoris/xbuild)

# Requirements

## Usage

### Expample
```
xbuild_perl 'install test perl 5.16.3' do
  version '5.16.3'
  prefix '/usr/local/bin/perl-5.16.3'
end

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
```

## Recipes

  * [build-essential](http://community.opscode.com/cookbooks/build-essential)
  * [git](http://community.opscode.com/cookbooks/git)

# Author

Satoshi SUZUKI (<studio3104.com@gmail.com>)
