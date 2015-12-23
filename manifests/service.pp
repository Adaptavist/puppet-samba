# == Class: samba::service
#
# Start, stop or restart the samba service.
#
# === Authors
#
# Evgeny Zislis <ezislis@adaptavist.com>
#
# === Copyright
#
# Copyright 2014 Adaptavist Ltd, unless otherwise noted.
#
class samba::service(
  $absent      = $samba::absent,
  $disable     = $samba::disable,
  $disableboot = $samba::disableboot,
  $service     = $samba::params::service,
  $package     = $samba::params::package,
  ) inherits samba::params {

  $manage_service_ensure = $disable ? {
    true    => 'stopped',
    default =>  $absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_enable = $disableboot ? {
    true    => false,
    default => $disable ? {
      true    => false,
      default => $absent ? {
        true  => false,
        false => true,
      },
    },
  }

  service { 'samba':
    name      => $service,
    ensure    => $manage_service_ensure,
    enable    => $manage_service_enable,
    hasstatus => true,
    require   => $package ? {
      ''      => undef,
      default => Package[samba], # from samba::package
    }
  }

}
