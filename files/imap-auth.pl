use Net::IMAP::Simple;

sub imapLogin {
  my $host = shift;
  my $account = shift;
  my $password = shift;

  # open a connection to the IMAP server
  if (! ($server = Net::IMAP::Simple->new($host,
      use_ssl           => 1,
      find_ssl_defaults => [
        SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_PEER,
      ],
      ))) {
    return 0;
  }

  # if we have a " in a password, we need to escape that, as the perl IMAP
  # library won't do that for us. Otherwise authentication will fail.
  $password =~ s/"/\\"/g;

  # login, if success return 1 (true?) and 0 (false?)
  if ($server->login( $account => $password )) {
    return 1;
  } else {
    return 0;
  }
  $server->close();
}
