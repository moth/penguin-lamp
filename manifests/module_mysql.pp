# Install MySQL and set up an example database
class { '::mysql::server':
  root_password           => 'meanFook60',
  remove_default_accounts => true,
}

mysql::db { 'cat_pictures':
  user     => 'greebo',
  password => 'tabby',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}
