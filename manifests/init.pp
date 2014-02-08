# manifests/init.pp - module to manage exim imap auth

class exim_imap_auth {
  include exim_imap_auth::base

  if str2bool($::selinux) {
    include exim_imap_auth::selinux
  }
}
