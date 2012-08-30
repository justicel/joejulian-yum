class yum::supplemental::ius{
    case $::operatingsystem {
        centos,rhel: {
            yum::managed_yumrepo {
                'ius':
                    descr => 'IUS Community Packages for Enterprise Linux $releasever - $basearch',
                    baseurl => absent,
                    mirrorlist => 'http://dmirr.iuscommunity.org/mirrorlist?repo=ius-el$releasever&arch=$basearch',
                    enabled => 1,
                    gpgcheck => 1,
                    gpgkey  => "http://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY",
                    failovermethod => 'priority',
                    require => Yumrepo['epel'],
                    priority => 17;
            }
        }
        fedora: {
            yum::managed_yumrepo {
                'ius':
                    descr => 'IUS Community Packages for Enterprise Linux $releasever - $basearch',
                    baseurl => absent,
                    mirrorlist => 'http://dmirr.iuscommunity.org/mirrorlist?repo=ius-el5&arch=$basearch',
                    includepkgs => 'yum-plugin-replace',
                    enabled => 1,
                    gpgcheck => 1,
                    gpgkey  => "http://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY",
                    failovermethod => 'priority',
                    priority => 17;
            }
        }
        default: {
            fail("no managed repo yet for this distro")
        }
    }
}
