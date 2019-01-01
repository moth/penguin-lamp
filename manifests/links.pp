# include symlinks

file { '/home/mauvamoth/puppet':
  ensure => link,
  target => '/etc/puppetlabs/code/environments/production',
  owner  => 'mauvamoth',
  group  => 'mauvamoth',
}

file { '/home/mauvamoth/sites':
  ensure => link,
  target => '/var/www',
  owner  => 'mauvamoth',
  group  => 'mauvamoth',
}
