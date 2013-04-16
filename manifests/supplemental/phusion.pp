class yum::supplemental::phusion{
  include yum::supplemental::epel

  case $::operatingsystem {
    centos,rhel: {
      yum::managed_yumrepo { 'phusion':
        descr          => "Phusion Passenger packages for ${::operatingsystem} \$releasever - \$basearch",
        baseurl        => "http://passenger.stealthymonkeys.com/rhel/\$releasever/\$basearch/",
        mirrorlist     => absent,
        enabled        => 1,
        gpgcheck       => 1,
        gpgkey         => 'http://passenger.stealthymonkeys.com/RPM-GPG-KEY-stealthymonkeys.asc',
        failovermethod => 'priority',
        priority       => 1;
        require        => Yumrepo['epel'],
      }
    }
    fedora: {}
    default: {
      fail("no managed repo yet for this distro")
    }
  }
}
