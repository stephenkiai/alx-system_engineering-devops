# Adding a custom HTTP header with Puppet

# Update the package list
exec { 'update-package-list':
  command     => '/usr/bin/apt-get update',
  refreshonly => true,
}

# Ensure Nginx is installed
class { 'nginx':
  ensure => 'installed',
}

# Create a custom HTTP response header
file { '/etc/nginx/conf.d/custom-header.conf':
  ensure  => 'present',
  content => "add_header X-Served-By $hostname;\n",
}

# Notify Nginx service to reload configuration
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  subscribe => File['/etc/nginx/conf.d/custom-header.conf'],
}