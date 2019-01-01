package { 'ruby':
  ensure => installed,
}

package { 'bundler':
  ensure   => installed,
  provider => gem,
}

package { 'generate-puppetfile':
  ensure   => installed,
  provider => gem,
}
