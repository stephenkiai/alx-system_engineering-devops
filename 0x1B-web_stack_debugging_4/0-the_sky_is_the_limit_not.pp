# Increases the ULIMIT of the etc/default/nginx file
file { '/etc/default/nginx':
  ensure  => file,
  content => "ULIMIT='-n 2500'\n",
}

#restart Nginx

exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
  