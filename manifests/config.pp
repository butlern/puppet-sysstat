# == Class sysstat::config
#
# This class is called from sysstat
#
class sysstat::config {

  # Ensure cron files exist in case some other resource is managing those
  # directories with purge => true.
  file { $::sysstat::sa1_cronfile: }
  file { $::sysstat::sa2_cronfile: }

  # Configs
  file_line { "${::sysstat::defaults}-enable" :
    path  => $::sysstat::defaults,
    match => 'ENABLED=',
    line  => "ENABLED=\"${::sysstat::service_enable}\"",
  }

  file_line { "${::sysstat::defaults}-sa1_options" :
    path  => $::sysstat::defaults,
    match => 'SA1_OPTIONS=',
    line  => "SA1_OPTIONS=\"${::sysstat::sa1_options}\"",
  }

  file_line { "${::sysstat::defaults}-sa2_options" :
    path  => $::sysstat::defaults,
    match => 'SA2_OPTIONS=',
    line  => "SA2_OPTIONS=\"${::sysstat::sa2_options}\"",
  }

  file_line { "${::sysstat::config}-history" :
    path  => $::sysstat::config,
    match => 'HISTORY=',
    line  => "HISTORY=${::sysstat::history}",
  }

  file_line { "${::sysstat::config}-compress" :
    path  => $::sysstat::config,
    match => 'COMPRESSAFTER=',
    line  => "COMPRESSAFTER=${::sysstat::compress}",
  }
}
