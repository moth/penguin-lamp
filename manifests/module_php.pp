class { '::php':
  ensure     => latest,
  extensions => {
    mbstring => {},
  }
}
