class exim-imap-auth::base {
    package { 'exim-imap-auth':
        ensure => absent,
    }

    file{'/etc/exim/imap-auth.pl':
      source => "puppet:///modules/exim-imap-auth/imap-auth.pl",
      require => Package['exim'],
      before => Service['exim'],
      owner => root, group => root, mode => 0755;
    }
}
