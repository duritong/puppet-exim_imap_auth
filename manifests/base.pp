class exim-imap-auth::base {
    package { 'perl-Net-IMAP-Simple-SSL':
      ensure => present,
    }

    file{'/etc/exim/imap-auth.pl':
      source => "puppet:///modules/exim-imap-auth/imap-auth.pl",
      require => Package['exim'],
      before => Service['exim'],
      owner => root, group => root, mode => 0755;
    }
}
