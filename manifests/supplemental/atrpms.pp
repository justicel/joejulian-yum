#AtRPMS yum repository
class yum::supplemental::atrpms {
  case $::operatingsystem {
    centos: {
      yum::managed_yumrepo {
        "centos${::lsbmajdistrelease}-atrpms":
          descr    => 'CentOS $releasever - $basearch - ATrpms',
          baseurl  =>
            'http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable',
          enabled  => 1,
          gpgcheck => 0,
          gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms',
          priority => 30;
      }
    }
    default : {
      fail('No managed repo yet for this distro')
    }
  }
}
