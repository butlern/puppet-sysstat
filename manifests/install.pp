# == Class sysstat::install
#
# This class is meant to be called from sysstat
# Installs the package.
#
class sysstat::install {

  package { $::sysstat::package_name:
    ensure => $::sysstat::package_ensure,
  }
}
