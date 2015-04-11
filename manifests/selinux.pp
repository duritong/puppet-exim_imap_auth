# exim needs to connect to various ports
class exim_imap_auth::selinux {
  if ($::osfamily == 'RedHat') and
    versioncmp($::operatingsystemmajrelease,'6') == 0 {
    selboolean{
      'allow_ypbind':
        value      => 'on',
        persistent => true,
    }
  }
}
