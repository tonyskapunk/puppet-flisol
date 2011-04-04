#

class http {
  package {
    "httpd":
      ensure => installed,
  }
  service {
    
  }
  $http_package = $operatingsystem ? {
    "CentOS" => "httpd",
    "Ubuntu" => "httpd";
  }
}
