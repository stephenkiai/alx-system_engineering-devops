# make user holberton to open files error free by increasing file limit
exec { 'change_hard_file_value':
     command => "/bin/sed -i 's/5/100/g' /etc/security/limits.conf"
     }

exec { 'change_soft_file_value':
     command => "/bin/sed -i 's/4/90/g' /etc/security/limits.conf"
     }