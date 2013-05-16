#RPMForge yum repository
class yum::supplemental::rpmforge {

  case $::operatingsystem {
    centos,rhel: {
      yum::managed_yumrepo {
        "rpmforge-rhel${::operatingsystemmajrelease}":
          descr      => "RPMForge RHEL${::operatingsystemmajrelease} packages",
          baseurl    => absent,
          mirrorlist =>
            'http://apt.sw.be/redhat/el$releasever/en/mirrors-rpmforge',
          enabled    => 1,
          exclude    => 'nagios-nrpe',
          gpgcheck   => 1,
          gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
          priority   => 30;
      }
    }
    default: {
      fail('No managed repo yet for this distro')
    }
  }
}
