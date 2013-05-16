class yum::prerequisites {
  package {
    'yum-priorities' :
      ensure => present,
  }
  case $::operatingsystem {
    rhel,centos: {
      if ($::operatingsystemmajrelease > 5) {
        Package['yum-priorities']{
          name => 'yum-plugin-priorities'
        }
      }
    }
    fedora: {
      if ($::operatingsystemmajrelease > 14) {
        Package['yum-priorities']{
          name => 'yum-plugin-priorities'
        }
      }
    }
  }

# ensure there are no other repos
  file {
    'yum_repos_d' :
      path    => '/etc/yum.repos.d/',
      ensure  => directory,
      recurse => true,
      purge   => true,
      force   => true,
      require => Package[yum-priorities],
      before  => Anchor['yum::prerequisites::done'],
      mode    => 0755,
      owner   => root,
      group   => 0 ;

    'rpm_gpg' :
       path         => '/etc/pki/rpm-gpg/',
       source       => [
         "puppet:///modules/yum/rpm-gpg/${::operatingsystem}.${::operatingsystemmajrelease}/",
         "puppet:///modules/yum/rpm-gpg/default/"
       ],
       sourceselect => all,
       require      => Package[yum-priorities],
       before       => Anchor['yum::prerequisites::done'],
       recurse      => true,
       purge        => true,
       force        => true,
       owner        => root,
       group        => 0,
       mode         => '600' ;
  }

  anchor{'yum::prerequisites::done': }
}
