# Add Nginx stable repository
apt::ppa { 'nginx/stable':
  ensure => present,
}

# Update software packages list
apt::update { 'update_packages':
  before => Package['nginx'],
}

# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Allow HTTP in firewall
sudo ufw::allow { 'Nginx HTTP':
  before => Package['nginx'],
}

# Ensure www folder has correct permissions
file { '/var/www':
  ensure => directory,
  mode   => '0755',
}

# Create index and 404 pages
file { '/var/www/html/index.html':
  content => "Hello World!\n",
}
file { '/var/www/html/404.html':
  content => "Ceci n'est pas une page\n",
}

# Manage Nginx default configuration
file { '/etc/nginx/sites-enabled/default':
  ensure  => file,
  content => template('nginx/default_config.erb'),
  require => Package['nginx'],
}

# Reload Nginx when configuration changes
service { 'nginx':
  ensure     => running,
  hasrestart => true,
  hasstatus  => true,
  subscribe  => File['/etc/nginx/sites-enabled/default'],
}

# Define custom 404 config
class nginx::custom_config {
  file { '/etc/nginx/conf.d/custom_config.conf':
    ensure  => file,
    content => template('nginx/custom_config.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}