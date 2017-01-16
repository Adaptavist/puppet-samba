# == Class: samba::package
#
# Install the samba package.
# Package name is defined in samba::params.
#
# === Authors:
#
# Evgeny Zislis <ezislis@adaptavist.com>
#
# === Copyright:
#
# Copyright 2014 Adaptavist Ltd, unless otherwise noted
#
class samba::package(
    $absent  = $samba::absent,
    $package = $samba::params::package,
    ) inherits samba::params {

  $package_ensure = $absent ? {
    true  => 'absent',
    false => 'present'
  }

  if $package {
    package { 'samba':
      ensure => $package_ensure,
      name   => $package,
    }
  }
}
