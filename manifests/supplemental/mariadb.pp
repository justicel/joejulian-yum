#MariaDB yum repository
class yum::supplemental::mariadb {
  include stdlib
  $mariadbarch = $::architecture ? {
    'x86_64' => 'amd64',
    default  => 'x86',
  }
  $mariadbos   = downcase($::operatingsystem)
  case $::operatingsystem {
    centos,rhel: {
      yum::managed_yumrepo {
        'mariadb':
          descr          => 'MariaDB repository for RHEL/CentOS - $basearch',
          baseurl        =>
            "http://yum.mariadb.org/5.5/${mariadbos}\$releasever-${mariadbarch}",
          gpgkey         => 'http://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
          enabled        => 1,
          gpgcheck       => 1,
          failovermethod => 'priority',
          priority       => 1,
      }
    }
    fedora: {
      if $::lsbmajdistrelease < 16 {
        yum::managed_yumrepo {
          'mariadb':
            descr          => 'MariaDB repository for RHEL/CentOS - $basearch',
            baseurl        =>
              "http://yum.mariadb.org/5.5/centos5-${mariadbarch}",
            gpgkey         => 'http://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
            enabled        => 1,
            gpgcheck       => 1,
            failovermethod => 'priority',
            priority       => 1,
        }
      } else {
        yum::managed_yumrepo {
          'mariadb':
            descr          => 'MariaDB repository for RHEL/CentOS - $basearch',
            baseurl        =>
              "http://yum.mariadb.org/5.5/${mariadbos}\$releasever-${mariadbarch}",
            gpgkey         => 'http://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
            enabled        => 1,
            gpgcheck       => 1,
            failovermethod => 'priority',
            priority       => 1,
        }
      }
    }
    default: {
      fail('No managed repo yet for this distro')
    }
  }
}
