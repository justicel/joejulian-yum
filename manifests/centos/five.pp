class yum::centos::five {
  yum::managed_yumrepo {
    'addons' :
      descr => 'CentOS-$releasever - Addons',
      mirrorlist => absent,
        baseurl => 'http://puppet/centos/$releasever/addons/$basearch/',
      enabled => 1,
      gpgcheck => 1,
      gpgkey => 'http://puppet/centos/$releasever/os/$basearch/RPM-GPG-KEY-CentOS-$releasever',
      priority => 1 ;
  }

  # sometimes yum-cron does not clean up things properly on EL5,
  # so we enforce some cleanup here
  tidy {
    "/var/lock" :
      age => "2d",
      recurse => 1,
      matches => ["yum-cron.lock"],
      rmdirs => true,
      type => ctime,
  }
}
