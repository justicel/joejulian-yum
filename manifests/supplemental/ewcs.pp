class yum::supplemental::ewcs {
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')

    case $::operatingsystem {
        centos,rhel: {
            yum::managed_yumrepo {
                'ewcs':
                    descr => 'Ed Wyse Internal Repo $releasever - $basearch',
                    baseurl => 'http://puppet/repo/$releasever/$basearch',
                    mirrorlist => absent,
                    enabled => 1,
                    gpgcheck => 0,
                    failovermethod => 'priority',
                    priority => 1;
            }
        }
    }
}
