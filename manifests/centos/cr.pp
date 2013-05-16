#CentOS 'CR' repository
class yum::centos::cr {
  package{'centos-release-cr':
    ensure => installed,
  }
  yum::managed_yumrepo{'CentOS-CR':
    descr    => 'CentOS-$releasever - CR',
    baseurl  => 'http://puppet/centos/$releasever/cr/$basearch/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   =>
      'http://puppet/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
    priority => 1,
    require  => Package['centos-release-cr'],
  }
}
