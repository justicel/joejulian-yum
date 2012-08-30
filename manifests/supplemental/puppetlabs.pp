class yum::supplemental::puppetlabs {
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')
    case $::operatingsystem {
        centos,rhel: {
            $repobase = 'el'
            $releasever = $osmajor
        }
        fedora: {
            if $osmajor == 6 {
                $repobase = 'el'
                $releasever = 5
            } else {
                $repobase = 'fedora'
                $releasever = "f$osmajor"
            }
        }
        default: {
            fail("no managed repo yet for this distro")
        }
    }
    yum::managed_yumrepo {
        'puppetlabs':
            descr => 'Puppet Labs puppet repo',
            baseurl => "http://yum.puppetlabs.com/$repobase/$releasever/products/\$basearch",
            enabled => 1,
            gpgcheck => 1,
            failovermethod => 'priority',
            gpgkey  => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
            priority => 1;
        'puppetlabs-source':
            descr => 'Puppet Labs puppet source repo',
            baseurl => "http://yum.puppetlabs.com/$repobase/$releasever/products/SRPMS",
            enabled => 0,
            gpgcheck => 1,
            failovermethod => 'priority',
            gpgkey  => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
            priority => 1;
        'puppetlabs-devel':
            descr => 'Puppet Labs puppet repo - devel',
            baseurl => "http://yum.puppetlabs.com/$repobase/$releasever/devel/\$basearch",
            enabled => 0,
            gpgcheck => 1,
            failovermethod => 'priority',
            gpgkey  => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
            priority => 1;
        'puppetlabs-deps':
            descr => 'Puppet Labs puppet repo - dependencies',
            baseurl => "http://yum.puppetlabs.com/$repobase/$releasever/dependencies/\$basearch",
            enabled => 1,
            gpgcheck => 1,
            failovermethod => 'priority',
            gpgkey  => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
            priority => 90;
    }
}
