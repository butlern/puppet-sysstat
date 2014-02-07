# == Class: sysstat
#
# Full description of class sysstat here.
#
# === Parameters
#
# [*package_name*]
#   The name of the package. Default is 'sysstat'.
#
# [*package_ensure*]
#   The state of the package, 'absent', 'installed'. Can also specify the
#   package version, e.g. '1.2.3-1' to pin a version. Default is 'present'.
#
# [*service_enable*]
#   Boolean. Whether to enable or disable the service. Defaults to true.
#
# [*config*]
#   The path to the sysstat config file.
#
# [*defaults*]
#   The path to the sysstat defaults file.
#
# [*sa1_cronfile*]
#   The path to the sa1 cronfile.
#
# [*sa2_cronfile*]
#   The path to the sa2 cronfile.
#
# [*sa1_options*]
#   You can pass additional options to sa1 here. For more info see sa1(8).
#   Default is "-S DISK".
#
# [*sa2_options*]
#   You can pass additional options to sa2 here. For more info see sa2(8).
#
# [*history*]
#   How long to keep the log files (in days). Default is 7.
#
# [*compress*]
#   Compress sa an sar files older than (in days). Default is 10.
#
class sysstat (
  $package_name = hiera('sysstat::package_name',
                          $sysstat::params::package_name),
  $package_ensure = hiera('sysstat::package_ensure',
                          $sysstat::params::package_ensure),
  $service_enable = hiera('sysstat::service_enable',
                          $sysstat::params::service_enable),
  $config = hiera('sysstat::config', $sysstat::params::config),
  $defaults = hiera('sysstat::defaults', $sysstat::params::defaults),
  $sa1_cronfile = hiera('sysstat::sa1_cronfile',
                        $sysstat::params::sa1_cronfile),
  $sa2_cronfile = hiera('sysstat::sa2_cronfile',
                        $sysstat::params::sa2_cronfile),
  $sa1_options = hiera('sysstat::sa1_options', $sysstat::params::sa1_options),
  $sa2_options = hiera('sysstat::sa2_options', $sysstat::params::sa2_options),
  $history = hiera('sysstat::history', $sysstat::params::history),
  $compress = hiera('sysstat::compress', $sysstat::params::compress),
) inherits sysstat::params {

  # validate parameters here

  validate_bool($service_enable)

  anchor { 'sysstat::begin': } ->
  class { 'sysstat::install': } ->
  class { 'sysstat::config': }
  anchor { 'sysstat::end': }

}
