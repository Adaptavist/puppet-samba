# == Class: samba::config
#
# Used to create a configuration file for samba.
#
# === Parameters:
#
# Parameter defaults are in samba::params.
#
# Hiera parameters reside in 2 hashes,
#   samba::global    - global definitions for samba.
#   samba::sections  - per-section definitions for samba.
#
# Hiera example:
#
# samba::global:
#   realm:     EXAMPLE.COM
#   security:  ADS
#   workgroup: EXAMPLE.COM
#   kerberos method: system keytab
#
# samba::sections:
#   printers:
#     printable: yes
#     print command: /usr/bin/lpr -P%p -r %s
#
# === Usage example:
#
# Used by the 'samba' module's init manifest.
#
# class { 'samba': }
#
#   - or -
#
# include samba
#
# === Authors:
#
# Evgeny Zislis <ezislis@adaptavist.com>
#
# === Copyright:
#
# Copyright 2014 Adaptavist Ltd, unless otherwise noted
#
class samba::config inherits samba::params {

  $manage_options_global = merge(
    $samba::params::default_options_global,
    hiera_hash('samba::global', {})
  )

  $manage_options_sections = merge(
    $samba::params::default_options_sections,
    hiera_hash('samba::options', {})
  )

  $manage_file = $samba::absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_audit = $samba::audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $samba::audit_only ? {
    true  => false,
    false => true,
  }

  $manage_service_autorestart = $samba::service_autorestart ? {
    true    => 'Service[samba]',
    false   => undef,
  }

  file { 'samba.conf':
    ensure  => $manage_file,
    content => template($samba::template),
    path    => $samba::params::config_file,
    mode    => $samba::params::config_file_mode,
    owner   => $samba::params::config_file_owner,
    group   => $samba::params::config_file_group,
    audit   => $manage_audit,
    replace => $manage_file_replace,
    notify  => $manage_service_autorestart,
  }

}
