#Adobe for linux YUM repository
class yum::supplemental::adobe {
  case $::operatingsystem {
    centos, redhat, fedora: {
      yum::managed_yumrepo {
        'adobe-i386':
          descr      => 'Adobe $releasever - i386',
          baseurl    => 'http://linuxdownload.adobe.com/linux/i386/',
          mirrorlist => absent,
          enabled    => 1,
          gpgcheck   => 0,
          priority   => 30;
        'adobe-x86_64':
          descr      => 'Adobe $releasever - x86_64',
          baseurl    => 'http://linuxdownload.adobe.com/linux/x86_64/',
          mirrorlist => absent,
          enabled    => 1,
          gpgcheck   => 0,
          priority   => 30;
      }
    }
    default : {
      fail('No managed repo yet for this distro')
    }
  }
}
