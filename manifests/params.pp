# == Class: samba::params
#
# Default parameters for samba configuration and module code.
#
# === Authors
#
# Evgeny Zislis <ezislis@adaptavist.com>
#
# === Copyright
#
# Copyright 2014 Adaptavist Ltd, unless otherwise noted.
#
class samba::params {

  $package = $::operatingsystem ? {
    default => 'samba',
  }

  $service = $::operatingsystem ? {
    /(?i:Centos|RedHat|Scientific|Fedora|Amazon|Linux)/ => 'smb',
    /(?i:SLES|OpenSuSE)/                                => 'smb',
    /(?i:Ubuntu|Mint)/                                  => 'smbd',
    /(?i:Debian)/                                       => 'samba',
    default                                             => 'smb',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/samba/smb.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  # General Settings
  $source = ''
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false
  $audit_only = false

  $default_options_global = {
    # 'option1'       => 'value',
    # 'option2'       => 'value',
    'security'        => 'ADS',
    'realm'           => 'EXAMPLE.COM',
    'workgroup'       => 'EXAMPLE',
    'kerberos method' => 'system keytab', # creates /etc/krb5.keytab, used by sssd
  }

  $default_options_sections = {
    # 'section_name' => {
    #   'option1' => 'value1',
    #   'option2' => 'value2',
    # }
  }
}
