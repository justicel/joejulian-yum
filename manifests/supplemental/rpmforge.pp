class yum::supplemental::rpmforge {
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')

    case $::operatingsystem {
        centos,rhel: {
            yum::managed_yumrepo {
                "rpmforge-rhel${osmajor}":
                    descr => "RPMForge RHEL${osmajor} packages",
                    baseurl => absent,
                    mirrorlist => 'http://apt.sw.be/redhat/el$releasever/en/mirrors-rpmforge',
                    enabled => 1,
                    exclude => 'nagios-nrpe',
                    gpgcheck => 1,
                    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
                    priority => 30;
            }
        }
        default: {
            fail("no managed repo yet for this distro")
        }
    }
}
