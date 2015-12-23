# == Class: krb5::adsjoin::kerberos
#
# Joins ADS domain using existing krb5 credentials.
#
# === Usage example:
#
# class { 'samba::adsjoin::kerberos': }
#
# === Authors:
#
# Evgeny Zislis <ezislis@adaptavist.com>
#
# === Copyright:
#
# Copyright 2014 Adaptavist Ltd, unless otherwise noted
#
class samba::adsjoin::kerberos {
  exec { "net ads join -k":
    environment => [ "LOGNAME=root" ], # required to use root's kerberos
    unless      => "net ads testjoin -k",
  }
}
