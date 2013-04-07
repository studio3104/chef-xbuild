default['xbuild']['path'] = '/usr/local/bin/xbuild'
default['xbuild']['include_recipes'] = %w{ git build-essential }

case node[:platform]
when 'redhat', 'centos'
  default['xbuild']['depends'] = %w{
    openssl-devel
    zlib-devel
    readline-devel
    re2c
    libxml2-devel
    libcurl-devel
    libjpeg-devel
    libpng-devel
    libmcrypt-devel
    libtidy-devel
    libxslt-devel
  }
  default['xbuild']['include_recipes'].concat(%w{
    yum
    yum::epel
    yum::repoforge
  })
when 'ubuntu', 'debian'
  default['xbuild']['depends'] = %{
    build-essential
    openssl
    libssl-dev
    libreadline-dev
    libxml2-dev
    libcurl4-gnutls-dev
    libjpeg62-dev
    re2c
  }
end

default['perl_build']['bin'] = "#{default['xbuild']['path']}/bin/perl-build"
default['perl_build']['fatpack_cpanm'] = "#{default['xbuild']['path']}/bin/fatpack_cpanm"

default['ruby_build']['bin']   = "#{default['xbuild']['path']}/bin/ruby-build"
default['php_build']['bin']    = "#{default['xbuild']['path']}/bin/php-build"
default['python_build']['bin'] = "#{default['xbuild']['path']}/bin/python-build"
