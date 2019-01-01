# include apache

class { 'apache':
  default_vhost => false,
  mpm_module => 'prefork',
}

include apache::mod::php


apache::vhost { 'moth.zapto.org':
  port          => '80',
  docroot       => '/var/www/cat-pictures',
  docroot_owner => 'mauvamoth',
  docroot_group => 'www-data',
}

file { '/var/www/cat-pictures/index.html':
  content => "<img src='http://bitfieldconsulting.com/files/happycat.jpg'>",
  owner   => 'mauvamoth',
  group   => 'www-data',
}

apache::vhost { 'michaelthomas.zapto.org':
  port          => '80',
  docroot       => '/var/www/michaelthomas',
  docroot_owner => 'mauvamoth',
  docroot_group => 'www-data',
}
