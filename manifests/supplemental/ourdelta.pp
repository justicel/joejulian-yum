class yum::supplemental::ourdelta {
    case $::operatingsystem {
        centos,rhel,fedora: {
            yum::managed_yumrepo {
                'ourdelta':
                    descr => 'OurDelta MariaDB repository for RHEL/CentOS - $basearch',
                    baseurl => 'http://master.ourdelta.org/yum/CentOS-MariaDB52/$basearch',
                    enabled => 1,
                    gpgcheck => 0,
                    failovermethod => 'priority',
                    priority => 1;
            }
        }
        default: {
            fail("no managed repo yet for this distro")
        }
    }
}
