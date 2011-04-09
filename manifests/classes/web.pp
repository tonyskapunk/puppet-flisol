class web($sitename) {
  $apache = $operatingsystem ? {
    /(CentOS|RedHat|Fedora)/ => "httpd",
    /(Debian|Ubuntu)/        => "apache2"
  }
  file {
    "/etc/$apache/conf.d/$sitename.conf":
      owner   => root,
      group   => root,
      mode    => 644,
      source  => "puppet:///modules/http/$sitename.conf",
      notify  => Service["$apache"],
      require => Package["$apache"];
    "/opt/www":
      ensure => directory,
      mode   => 755;
    "/opt/www/$sitename":
      ensure => directory,
      mode   => 755;
    "/opt/www/$sitename/index.html":
      source => template("http/$sitename.erb");
  }
}

class flisol {
  class { "web": sitename => "flisol"; }
}
