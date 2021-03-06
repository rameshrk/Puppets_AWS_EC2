node default {
  file { '/tmp/hello7': content => 'hello bogotobogo.co' }
  include memcached
#  package { 'httpd': ensure => 'installed' }
}

node 'ec2-52-91-185-226.compute-1.amazonaws.com' {
  
  include sudo
  include apache
  #  include mysql
  #  include postfix
  include ssh

  file { '/tmp/hello3': content => 'hello bogotobogo.com' }

#  service { 'httpd':
#    ensure  => running,
#    require => Package['httpd'],
#  }

#  package { 'httpd': ensure => installed, }
#
#  file { '/etc/httpd/conf.d/cookbook.conf':
#    content => "<VirtualHost *:80>\nServername
#             cookbook\nDocumentRoot
#             /var/www/cookbook\n</VirtualHost>\n",
#    require => Package['httpd'],
#    notify  => Service['httpd'],
#  }

  file { '/var/www/cookbook': ensure => directory, }

  file { '/var/www/cookbook/index.html':
    content => "<html><h1>Hello World!</h1></html>\n",
    require => File['/var/www/cookbook'],
  }

  package { 'puppet-lint':
    ensure   => 'installed',
    provider => 'gem',
  }

  include memcached  

}

# node 'ec2-52-91-203-156.compute-1.amazonaws.com' {
# class { '::sudo':
#     users => ['tom', 'jerry'],
#  }
#}
