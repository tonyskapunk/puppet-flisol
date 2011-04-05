# Clase http esta clase instala, remueve, activa, desactiva apache.
#
# == Parameters
#
# No se hace uso de parametros.
#
# == Variables
#
# No se hace uso de variables.
#
# == Examples
#
#  Activatar http
#   include http::active
#
# == Authors
#
# Tony García <tonyskapunk@tonyskapunk.net\>
#
# == Copyright
#
# Copyright 2011  Tony Garcia.
#
# This program and entire repository is free software: you can redistribute it
# and/or modify it under the terms of the GNU# General Public License as
# published by the Free Software Foundation, either version 3 of the License,
# or any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see http://www.gnu.org/licenses/.
#

class http {
  $package_provider = $operatingsystem ? {
    /(CentOS|RedHat|Fedora)/ => 'yum',
    /(Debian|Ubuntu)/        => 'apt'
  }
  $apache_package = $operatingsystem ? {
    /(CentOS|RedHat|Fedora)/ => 'httpd',
    /(Debian|Ubuntu)/        => 'apache2'
  }
  package {
    "$apache_package":
      ensure   => latest,
      provider => $package_provider,
  }
  service {
    "$apache_package":
      hasstatus  => true,
      hasrestart => true,
      require    => Package["$apache_package"],
  }
}

class http::active inherits http {
  Service["$apache_package"] {
    enable => true,
    ensure => running, 
  }
}

class http::inactive inherits http {
  Service["$apache_package"] {
    enable => false,
    ensure => stopped,
  }
}

class http::absent inherits http {
  Package["$apache_package"] {
    ensure => absent,
  }
}

class http::purge inherits http {
  Package["apache_package"] {
    ensure => purged,
  }
}
