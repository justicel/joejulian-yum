#Nginx yum repository
class yum::supplemental::nginx{
  case $::operatingsystem {
    centos,rhel: {
      yum::managed_yumrepo { 'nginx-release':
        descr          =>
          "Up to date nginx packages for ${::operatingsystem} \$releasever - \$basearch",
        baseurl        =>
          'http://nginx.org/packages/rhel/$releasever/$basearch/',
        mirrorlist     => absent,
        enabled        => 1,
        gpgcheck       => 1,
        gpgkey         => 'http://nginx.org/keys/nginx_signing.key',
        failovermethod => 'priority',
        priority       => 1;
      }
    }
    fedora: {}
    default: {
      fail('No managed repo yet for this distro')
    }
  }
}
