class yum::supplemental::mariadb {
    include stdlib
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')
    $mariadbarch = $::architecture ? {
        'x86_64' => 'amd64',
        default  => 'x86',
    }
    $mariadbos   = downcase($::operatingsystem)
    case $::operatingsystem {
        centos,rhel: {
            yum::managed_yumrepo {
                'mariadb':
                    descr => 'MariaDB repository for RHEL/CentOS - $basearch',
                    baseurl => "http://yum.mariadb.org/5.5/${mariadbos}\$releasever-${mariadbarch}",
                    gpgkey  => "http://yum.mariadb.org/RPM-GPG-KEY-MariaDB",
                    enabled => 1,
                    gpgcheck => 1,
                    failovermethod => 'priority',
                    priority => 1,
            }
        }
        fedora: {
            if $osmajor < 16 {
                yum::managed_yumrepo {
                    'mariadb':
                        descr => 'MariaDB repository for RHEL/CentOS - $basearch',
                        baseurl => "http://yum.mariadb.org/5.5/centos5-${mariadbarch}",
                        gpgkey  => "http://yum.mariadb.org/RPM-GPG-KEY-MariaDB",
                        enabled => 1,
                        gpgcheck => 1,
                        failovermethod => 'priority',
                        priority => 1,
                }
            } else {
                yum::managed_yumrepo {
                    'mariadb':
                        descr => 'MariaDB repository for RHEL/CentOS - $basearch',
                        baseurl => "http://yum.mariadb.org/5.5/${mariadbos}16-${mariadbarch}",
                        gpgkey  => "http://yum.mariadb.org/RPM-GPG-KEY-MariaDB",
                        enabled => 1,
                        gpgcheck => 1,
                        failovermethod => 'priority',
                        priority => 1,
                }
            }
        }
        default: {
            fail("no managed repo yet for this distro")
        }
    }
}
