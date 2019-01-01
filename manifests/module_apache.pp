# include apache

class { 'apache':
  default_vhost => false,
  mpm_module => 'prefork',
}

include apache::mod::php


apache::vhost { 'moth.zapto.org':
  port          => '80',
  docroot       => '/var/www/cat-pictures',
  docroot_owner => 'www-data',
  docroot_group => 'www-data',
}

apache::vhost { 'moth2.zapto.org':
  port          => '80',
  docroot       => '/var/www/cat-pictures2',
  docroot_owner => 'www-data',
  docroot_group => 'www-data',
}

file { '/var/www/cat-pictures/index.html':
  content => "<img src='http://bitfieldconsulting.com/files/happycat.jpg'>",
  owner   => 'www-data',
  group   => 'www-data',
}

file { '/var/www/cat-pictures/index2.php':
  content => "<?php phpinfo(); ?>",
  owner   => 'www-data',
  group   => 'www-data',
}

file { '/var/www/cat-pictures2/index.html':
  content => "hello two",
  owner   => 'www-data',
  group   => 'www-data',
}
