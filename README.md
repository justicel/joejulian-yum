# The Yum Module

## Introduction
The module allows Puppet to manage the yum repositories that are installed.

## Dependencies
### Puppet:

  * [Puppet](http://docs.puppetlabs.com/puppet/) 2.7.12 or greater
  * [Facter](http://www.puppetlabs.com/puppet/related-projects/facter/) 1.6.1 or
        greater (versions that support the osfamily fact)

### Platforms:

      These modules have been fully tested on CentOS 5 and 6 and Fedora 6 and 16+

## Installation

Simply include the module for the standard repos.

    include yum

To include supplemental 3rd party repos, include them additionally:

    include yum::supplemental::epel

Since you can include a class any number of times, you can include a supplemental repo for any class that requires that repo. For instance, to have the latest glusterfs, both my glusterfs::server class and my glusterfs::client includes yum::supplemental::kkeithley. If a node is both server and client, this does not contend.
