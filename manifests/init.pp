# == Class: samba
#
# Install, configure and run samba.
#
# === Parameters
#
# [*absent*]
#   When set to true, will remove the samba package.
#
# [*disable*]
#   When set to true, will disable the smbd service.
#
# [*disableboot*]
#   When set to true, will stop smbd from running on boot.
#
# [*service_autorestart*]
#   When set to false, will not restart server when configuration file changes.
#
# [*audit_only*]
#   When true, only show possible changes to configuration without actually
#   changing the files.
#
# [*template*]
#   Allow override of default smb.conf template with a different one.
#
# === Usage example:
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
class samba (
  $absent              = false,
  $disable             = false,
  $disableboot         = false,
  $service_autorestart = true,
  $audit_only          = false,
  $template            = 'samba/smb.conf.erb',
){
  class { 'samba::package': } ->
  class { 'samba::config': } ->
  class { 'samba::service': } ->
  Class['samba']
}
