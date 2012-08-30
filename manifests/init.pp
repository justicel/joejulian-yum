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
class yum {
    # autoupdate
    $osmajor = regsubst("$operatingsystemrelease", '^(\d*).*$', '\1')
    package {
        'yum-cron' :
            ensure => present;
    }
    service {
        'yum-cron' :
            enable => true,
            ensure => running,
            hasstatus => true,
            hasrestart => true,
            require => Package[yum-cron];
    }
    case $operatingsystem {
        centos : {
            include yum::centos::base
            case $osmajor {
                5 : {
                    include yum::centos::five
                }
            }
        }
        fedora : {
            include yum::fedora::base
        }
        default : {
            fail("no managed repo yet for this distro")
        }
    }
    case $operatingsystem {
        centos,fedora: {
            file { "/etc/sysconfig/yum-cron":
                ensure => present,
                source => "puppet://puppet/modules/yum/sysconfig/yum-cron",
                mode   => "0644",
                owner  => "root",
                group  => "root",
            }
        }
    }
}
