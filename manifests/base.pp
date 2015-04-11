# install everything needed for the imap auth
class exim_imap_auth::base {
  package {'perl-Net-IMAP-Simple':
    ensure => present,
  } -> file{'/etc/exim/imap-auth.pl':
    source  => 'puppet:///modules/exim_imap_auth/imap-auth.pl',
    require => Package['exim'],
    before  => Service['exim'],
    owner   => root,
    group   => 0,
    mode    => '0755';
  }
}
