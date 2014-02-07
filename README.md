Puppet Sysstat Module
=====================

Puppet module for sysstat.

[![Build Status](https://travis-ci.org/chartbeat-labs/puppet-sysstat.png)](https://travis-ci.org/chartbeat-labs/puppet-sysstat)

Usage
-----

Include with default parameters:
```puppet
include sysstat
```

Include with the singleton pattern:

```puppet
class { '::sysstat' : }
```

### Runtime parameters
If you don't want sysstat running you can disable it:

```puppet
class { '::sysstat' :
  service_enable => false,
}
```

You can change various parameters for sar1:

```puppet
class { '::sysstat' :
  sa1_options => '-S ALL'
}
```

Or change how long it keeps history for and how soon
to compress data files:

```puppet
class { '::sysstat' :
  history  => 30,
  compress => 5,
}
```

### Hiera

All of the parameters support hiera lookups. The
hiera key is always of the format:

sysstat::*parameter*

So for instance, to selectively enable/disable
sysstat on hosts, create a hiera file with the
following to disable:

```
---
sysstat::service_enable: false
```

## License

See [LICENSE](LICENSE) file.
