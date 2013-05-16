#
# yum module
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Copyright 2012, Joe Julian <me@joejulian.name>
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License version 3 as published by
# the Free Software Foundation.
#
class yum (
  $repo_stage = 'main'
) {
  # autoupdate
  package { 'yum-cron':
    ensure => present,
  }
  service { 'yum-cron':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[yum-cron],
  }
  case $::operatingsystem {
    centos : {
      class{[ 'yum::centos::base',
              'yum::prerequisites' ]:
        stage => $repo_stage,
      }
      case $::operatingsystemmajrelease {
        5 : {
          class{'yum::centos::five':
            stage => $repo_stage,
          }
        }
        default: { }
      }
    }
    fedora : {
      class{ 'yum::fedora::base':
        stage => $repo_stage,
      }
    }
    default : {
      fail('No managed repo yet for this distro!')
    }
  }
  case $::operatingsystem {
    centos,fedora: {
      file { '/etc/sysconfig/yum-cron':
        ensure => present,
        source => 'puppet://puppet/modules/yum/sysconfig/yum-cron',
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
      }
    }
    default : { }
  }
}
