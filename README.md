# xbuild cookbook

Chef cookbook for [xbuild](https://github.com/tagomoris/xbuild)


# Requirements

## Recipes

  * [build-essential](http://community.opscode.com/cookbooks/build-essential)
  * [git](http://community.opscode.com/cookbooks/git)

## Platforms

### Supports

  * RedHat, CentOS

### Not supports (Have not tried)

  * Debian, Ubuntu
  * Fedora, Amazon, Scientific


# Usage

## Recipe

The listed as below, declare the 'include_recipe'.

```ruby
include_recipe 'xbuild'
```


# Examples

## Attributes & Recipes

### Perl

Install Perl 5.16.3 with Acme::AjiFry and Proclet.

 * Attribute

```ruby
{
  'perl' => {
     'version' => '5.16.3',
     'prefix'  => '/usr/local/bin/perl-5.16.3',
  }
}
```

* Recipe

```ruby
xbuild_perl "install perl #{node['perl']['version']}" do
  version node['perl']['version']
  prefix  node['perl']['prefix']
end

%w{
  Acme::AjiFry
  Proclet
}.each do |module_name|
  xbuild_cpanm module_name do
    options '--force --verbose'
    perl_root node['perl']['prefix']
  end
end
```

### Ruby

Install Ruby 1.9.3-p392 with ec2ssh and serverspec.

* Attribute

```ruby
{
  'ruby' => {
    'version' => '1.9.3-p392',
    'prefix'  => '/usr/local/bin/ruby-1.9.3',
  }
}
```

* Recipe

```ruby
xbuild_ruby "install ruby #{node['ruby']['version']}" do
  version node['ruby']['version']
  prefix  node['ruby']['prefix']
end

%w{
  ec2ssh
  serverspec
}.each do |module_name|
  xbuild_gem module_name do
    options '--no-rdoc --no-ri'
    ruby_root node['ruby']['prefix']
  end
end
```

### PHP

Install PHP 5.5snapshot with install option '--with-pear'.

* Attribute

```ruby
{
  'php' => {
    'version' => '5.5snapshot',
    'prefix'  => '/usr/local/bin/php-5.5snapshot',
    'options' => '--with-pear',
  }
}
```

* Recipe

```ruby
xbuild_php "install php #{node['php']['version']}" do
  version node['php']['version']
  options node['php']['options']
  prefix  node['php']['prefix']
end
```

### Python

Install Python 2.7.3

* Attribute

```ruby
{
  'python' => {
    'version' => '2.7.3',
    'prefix'  => '/usr/local/bin/python-2.7.3',
  }
}
```

* Recipe

```ruby
xbuild_python "install python #{node['python']['version']}" do
  version node['python']['version']
  prefix  node['python']['prefix']
end
```

### Node

Install Node.js v0.10.1

* Attribute

```ruby
{
  'node' => {
    'version' => 'v0.10.1',
    'prefix'  => '/usr/local/bin/node-0.10.1',
  }
}
```

* Recipe

```ruby
xbuild_node "install node #{node['node']['version']}" do
  version node['node']['version']
  prefix  node['node']['prefix']
end
```


# Author

Satoshi SUZUKI (<studio3104.com@gmail.com>)

# License

Apache License, Version 2.0
