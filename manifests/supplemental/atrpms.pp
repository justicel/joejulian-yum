class yum::supplimental::atrpms {
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')
    case $::operatingsystem {
        centos: {
            yum::managed_yumrepo {
                "centos${osmajor}-atrpms":
                    descr => 'CentOS $releasever - $basearch - ATrpms',
                    baseurl => 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable',
                    enabled => 1,
                    gpgcheck => 0,
                    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.atrpms',
                    priority => 30;
            }
        }
        default : {
            fail("no managed repo yet for this distro")
        }
    }
}
