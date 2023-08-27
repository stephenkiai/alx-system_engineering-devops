# client confg file edit using puppet
file {'/home/ubuntu/.ssh/config':
     ensure => present,
     content => "
     	     Host *
	     IdentityFile ~/.ssh/school
	     PasswordAuthentication no
	",
}