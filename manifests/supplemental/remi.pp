#Remi yum repository
class yum::supplemental::remi {
  case $::operatingsystem {
    centos,rhel: {
      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi' :
        source => 'puppet:///modules/yum/rpm-gpg/additional/RPM-GPG-KEY-remi',
        owner  => root,
        group  => 0,
        mode   => '0600' ;
      }
      yum::managed_yumrepo {
        'remi' :
          descr    =>
            'Les RPM de remi pour Enterpise Linux $releasever - $basearch',
          baseurl  =>
            'http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/',
          enabled  => 1,
          gpgcheck => 1,
          gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
          priority => 1,
          require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-remi'];
      }
    }
    default: {
      fail('No managed repo yet for this distro')
    }
  }
}
