 # Samba
[![Build Status](https://travis-ci.org/Adaptavist/puppet-samba.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-samba)

Install, configure and start Samba.

## Parameters

 [*absent*]
   When set to true, will remove the samba package.

 [*disable*]
   When set to true, will disable the smbd service.

 [*disableboot*]
   When set to true, will stop smbd from running on boot.

 [*service_autorestart*]
   When set to false, will not restart server when configuration file changes.

 [*audit_only*]
   When true, only show possible changes to configuration without actually
   changing the files.

 [*template*]
   Allow override of default smb.conf template with a different one.

 ## Usage example

```
 class { 'samba': }

   - or -

 include samba
```
