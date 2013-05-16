#Fedora base yum class
class yum::fedora::base {
  if ($::lsbmajdistrelease > 6) {
    yum::managed_yumrepo {
      'base':
        descr      => 'Fedora $releasever - $basearch',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 1,
        exclude    => 'glusterfs*',
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-$basearch',
        priority   => 1;
      'fedora-debuginfo':
        descr      => 'Fedora $releasever - $basearch - Debug',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-$basearch',
        priority   => 1;
      'fedora-source':
        descr      => 'Fedora $releasever - $basearch - Source',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=source',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-$basearch',
        priority   => 1;
      'updates':
        descr      => 'Fedora $releasever - $basearch - Updates',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 1,
        exclude    => 'glusterfs*',
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-$basearch',
        priority   => 1;
      'updates-debuginfo':
        descr      => 'Fedora $releasever - $basearch - Updates - Debug',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/updates/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-$basearch',
        priority   => 1;
      'updates-source':
        descr      => 'Fedora $releasever - $basearch - Updates Source',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-$releasever&arch=source',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/updates/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-$basearch',
        priority   => 1;
    }
  } else {
    yum::managed_yumrepo {
      'base':
        descr      => 'Fedora $releasever - $basearch',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=core-$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
      'fedora-debuginfo':
        descr      => 'Fedora $releasever - $basearch - Debug',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=core-debug-$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
      'fedora-source':
        descr      => 'Fedora $releasever - $basearch - Source',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=core-source-$releasever&arch=source',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
      'updates':
        descr      => 'Fedora $releasever - $basearch - Updates',
        mirrorlist => absent,
        baseurl    =>
          'http://archive.fedoraproject.org/pub/archive/fedora/linux/core/updates/$releasever/$basearch',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
      'extras':
        descr      => 'Fedora $releasever - $basearch - Extras',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=extras-$releasever&arch=$basearch',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
      'updates-debuginfo':
        descr      => 'Fedora $releasever - $basearch - Updates - Debug',
        mirrorlist =>
          'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-fc$releasever&arch=$basearch',
        baseurl    => absent,
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
      'updates-source':
        descr      => 'Fedora $releasever - $basearch - Updates Source',
        mirrorlist => absent,
        baseurl    =>
          'http://download.fedora.redhat.com/pub/fedora/linux/core/updates/$releasever/SRPMS/',
        enabled    => 0,
        gpgcheck   => 1,
        gpgkey     =>
          'http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/RPM-GPG-KEY-fedora',
        priority   => 1;
    }
  }
}
