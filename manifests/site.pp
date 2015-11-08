node default {
  file { "/tmp/hello2" :
    content => "hello bogotobogo.com"
  }
}

node 'ec2-52-91-67-250.compute-1.amazonaws.com' {
#  include sudo
#  include apache
#  include mysql
#  include postfix
#  include ssh
  file { "/tmp/hello3" :
    content => "hello bogotobogo.com"
  }
}

#node 'ec2-52-91-203-156.compute-1.amazonaws.com' {
#	class { '::sudo':
#     users => ['tom', 'jerry'],
#  }
#}

