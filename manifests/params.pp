# == Class sysstat::params
#
# This class is meant to be called from sysstat
# It sets variables according to platform
#
class sysstat::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'sysstat'
      $package_ensure = 'present'
      $service_enable = true
      $config = '/etc/sysstat/sysstat'
      $defaults = '/etc/default/sysstat'
      $sa1_cronfile = '/etc/cron.d/sysstat'
      $sa2_cronfile = '/etc/cron.daily/sysstat'
      $sa1_options = '-S DISK'
      $sa2_options = ''
      $history = 7
      $compress = 10
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
