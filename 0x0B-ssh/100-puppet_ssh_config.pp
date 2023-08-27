# client confg file edit using puppet
include stdlib

file_line { 'Ensure Password Authentication is Disabled':
  	  ensure  => present,
  	  path    => '/etc/ssh/ssh_config',
  	  line    => 'PasswordAuthentication no',
	  replace => true,
}

file_line { 'Specify Identity File for SSH':
  	  ensure  => present,
  	  path    => '/etc/ssh/ssh_config',
  	  line    => 'IdentityFile ~/.ssh/school',
  	  replace => true,
}