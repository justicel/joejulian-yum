#EPEL yum repository
class yum::supplemental::epel {

  $os_release_parts = split($operatingsystemrelease, '[.]')
  $operatingsystemmajrelease = $os_release_parts[0]

  case $::operatingsystem {
    centos,rhel: {
      $epelkey = $operatingsystemmajrelease ? {
        5 => 'RPM-GPG-KEY-EPEL',
        6 => 'RPM-GPG-KEY-EPEL-6',
      }
      yum::managed_yumrepo {
        'epel':
          descr          =>
            'Extra Packages for Enterprise Linux $releasever - $basearch',
          mirrorlist     =>
            'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch',
          enabled        => 1,
          exclude        => 'glusterfs*',
          gpgcheck       => 1,
          failovermethod => 'priority',
          gpgkey         =>
            "http://download.fedoraproject.org/pub/epel/${epelkey}",
          priority       => 16;
        'epel-debuginfo':
          descr          =>
            'Extra Packages for Enterprise Linux $releasever - $basearch - Debug',
          mirrorlist     =>
            'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch',
          enabled        => 0,
          gpgcheck       => 1,
          failovermethod => 'priority',
          gpgkey         =>
            "http://download.fedoraproject.org/pub/epel/${epelkey}",
          priority       => 16;
        'epel-source':
          descr          =>
            'Extra Packages for Enterprise Linux $releasever - $basearch - Source',
          mirrorlist     =>
            'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-$releasever&arch=$basearch',
          enabled        => 0,
          gpgcheck       => 1,
          failovermethod => 'priority',
          gpgkey         =>
            "http://download.fedoraproject.org/pub/epel/${epelkey}",
          priority       => 16;
        'epel-testing':
          descr          =>
            'Extra Packages for Enterprise Linux $releasever - Testing - $basearch',
          mirrorlist     =>
            'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-epel$releasever&arch=$basearch',
          enabled        => 0,
          gpgcheck       => 1,
          failovermethod => 'priority',
          gpgkey         =>
            "http://download.fedoraproject.org/pub/epel/${epelkey}",
          priority       => 15;
        'epel-testing-debuginfo':
          descr          =>
            'Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Debug',
          mirrorlist     =>
            'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel$releasever&arch=$basearch',
          enabled        => 0,
          gpgcheck       => 1,
          failovermethod => 'priority',
          gpgkey         =>
            "http://download.fedoraproject.org/pub/epel/${epelkey}",
          priority       => 15;
        'epel-testing-source':
          descr          =>
            'Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Source',
          mirrorlist     =>
            'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-source-epel$releasever&arch=$basearch',
          enabled        => 0,
          gpgcheck       => 1,
          failovermethod => 'priority',
          gpgkey         =>
            "http://download.fedoraproject.org/pub/epel/${epelkey}",
          priority       => 15;
      }
    }
    fedora: {
      if $::operatingsystemmajrelease < 14 {
        $epelkey = 'RPM-GPG-KEY-EPEL'

        yum::managed_yumrepo {
          'epel':
            descr          =>
              'Extra Packages for Enterprise Linux 5 - $basearch',
            mirrorlist     =>
              'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch',
            enabled        => 1,
            exclude        => 'glusterfs*',
            gpgcheck       => 1,
            failovermethod => 'priority',
            gpgkey         =>
              "http://download.fedoraproject.org/pub/epel/${epelkey}",
            priority       => 16;
          'epel-debuginfo':
            descr          =>
              'Extra Packages for Enterprise Linux 5 - $basearch - Debug',
            mirrorlist     =>
              'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch',
            enabled        => 0,
            gpgcheck       => 1,
            failovermethod => 'priority',
            gpgkey         =>
              "http://download.fedoraproject.org/pub/epel/${epelkey}",
            priority       => 16;
          'epel-source':
            descr          =>
              'Extra Packages for Enterprise Linux 5 - $basearch - Source',
            mirrorlist     =>
              'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-5&arch=$basearch',
            enabled        => 0,
            gpgcheck       => 1,
            failovermethod => 'priority',
            gpgkey         =>
              "http://download.fedoraproject.org/pub/epel/${epelkey}",
            priority       => 16;
          'epel-testing':
            descr          =>
              'Extra Packages for Enterprise Linux 5 - Testing - $basearch',
            mirrorlist     =>
              'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-epel5&arch=$basearch',
            enabled        => 0,
            gpgcheck       => 1,
            failovermethod => 'priority',
            gpgkey         =>
              "http://download.fedoraproject.org/pub/epel/${epelkey}",
            priority       => 17;
          'epel-testing-debuginfo':
            descr          =>
              'Extra Packages for Enterprise Linux 5 - Testing - $basearch - Debug',
            mirrorlist     =>
              'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel5&arch=$basearch',
            enabled        => 0,
            gpgcheck       => 1,
            failovermethod => 'priority',
            gpgkey         =>
              "http://download.fedoraproject.org/pub/epel/${epelkey}",
            priority       => 17;
          'epel-testing-source':
            descr          =>
              'Extra Packages for Enterprise Linux 5 - Testing - $basearch - Source',
            mirrorlist     =>
              'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-source-epel5&arch=$basearch',
            enabled        => 0,
            gpgcheck       => 1,
            failovermethod => 'priority',
            gpgkey         =>
              "http://download.fedoraproject.org/pub/epel/${epelkey}",
            priority       => 17;
        }
      }
    }
    default: {
      fail('No managed repo yet for this distro')
    }
  }
}
