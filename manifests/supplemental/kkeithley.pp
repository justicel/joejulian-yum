class yum::supplemental::kkeithley {
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')

    case $::operatingsystem {
        centos,rhel: {
            yum::managed_yumrepo {
                'kkeithley':
                    descr => 'Kaleb Keithley\'s Gluster Repo $releasever - $basearch',
                    baseurl => 'http://repos.fedorapeople.org/repos/kkeithle/glusterfs/epel-$releasever/$basearch',
                    mirrorlist => absent,
                    enabled => 1,
                    gpgcheck => 0,
                    failovermethod => 'priority',
                    priority => 1;
            }
        }
        fedora: {
            if ($osmajor < 16) {
                yum::managed_yumrepo {
                    'kkeithley':
                        descr => 'Kaleb Keithley\'s Gluster Repo 5 - $basearch',
                        baseurl => 'http://repos.fedorapeople.org/repos/kkeithle/glusterfs/epel-5/$basearch',
                        mirrorlist => absent,
                        enabled => 1,
                        gpgcheck => 0,
                        failovermethod => 'priority',
                        priority => 1;
                }
            } else {
                yum::managed_yumrepo {
                    'kkeithley':
                        descr => 'Kaleb Keithley\'s Gluster Repo $releasever - $basearch',
                        baseurl => 'http://repos.fedorapeople.org/repos/kkeithle/glusterfs/fedora-$releasever/$basearch',
                        mirrorlist => absent,
                        enabled => 1,
                        gpgcheck => 0,
                        failovermethod => 'priority',
                        priority => 1;
                }
            }
        }
        default: {
            fail("no managed repo yet for this distro")
        }
    }
}
