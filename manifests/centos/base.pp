#Base and basic default CentOS repositories
class yum::centos::base {
  if ($::network_eth0 == '10.0.0.0') {
    $repohost = 'http://puppet'
  } else {
    $repohost = 'http://mirror.centos.org'
  }

  yum::managed_yumrepo{
    'base':
      descr      => 'CentOS-$releasever - Base',
      mirrorlist => absent,
      baseurl    => 'http://mirror.centos.org/centos/$releasever/os/$basearch/',
      enabled    => 1,
      exclude    => 'glusterfs*',
      gpgcheck   => 1,
      gpgkey     =>
        'http://mirror.centos.org/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority   => 1;
    'updates':
      descr      => 'CentOS-$releasever - Updates',
      mirrorlist => absent,
      baseurl    => 'http://mirror.centos.org/centos/$releasever/updates/$basearch/',
      enabled    => 1,
      exclude    => 'glusterfs*',
      gpgcheck   => 1,
      gpgkey     =>
        'http://mirror.centos.org/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority   => 1;
    'extras':
      descr      => 'CentOS-$releasever - Extras',
      mirrorlist => absent,
      baseurl    => 'http://mirror.centos.org/centos/$releasever/extras/$basearch/',
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     =>
        'http://mirror.centos.org/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority   => 1;
    'centosplus':
      descr      => 'CentOS-$releasever - Centosplus',
      mirrorlist => absent,
      baseurl    => 'http://mirror.centos.org/centos/$releasever/centosplus/$basearch/',
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     =>
        'http://mirror.centos.org/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority   => 2;
    'contrib':
      descr      => 'CentOS-$releasever - Contrib',
      mirrorlist => absent,
      baseurl    => 'http://mirror.centos.org/centos/$releasever/contrib/$basearch/',
      gpgcheck   => 1,
      gpgkey     =>
        'http://mirror.centos.org/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority   => 10;
    "centos${::lsbmajdistrelease}-plus":
      descr      => 'CentOS-$releasever - Plus',
      mirrorlist => absent,
      baseurl    => 'http://mirror.centos.org/centos/$releasever/centosplus/$basearch/',
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     =>
        'http://mirror.centos.org/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority   => 15;
  }
}
