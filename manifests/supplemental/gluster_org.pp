class yum::supplemental::gluster_org{
  $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')

  case $::operatingsystem {
    centos,rhel: {
      yum::managed_yumrepo {
        'gluster.org':
          descr => 'Gluster.org\'s Repo $releasever - $basearch',
          baseurl => 'http://download.gluster.org/pub/gluster/glusterfs/repos/YUM/glusterfs-3.4/3.4/3.4.0/CentOS/epel-$releasever/$basearch',
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
          'gluster.org':
            descr => 'Gluster.org\'s Gluster Repo 5 - $basearch',
            baseurl => 'http://download.gluster.org/pub/gluster/glusterfs/repos/YUM/glusterfs-3.4/3.4/3.4.0/CentOS/epel-5/$basearch',
            mirrorlist => absent,
            enabled => 1,
            gpgcheck => 0,
            failovermethod => 'priority',
            priority => 1;
        }
      } elsif ($osmajor == 17 or $osmajor == 18) {
        yum::managed_yumrepo {
          'gluster.org':
            descr => 'Gluster.org\'s Gluster Repo $releasever - $basearch',
            baseurl => 'http://download.gluster.org/pub/gluster/glusterfs/repos/YUM/glusterfs-3.4/3.4/3.4.0/Fedora/fedora-$releasever/$basearch',
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
