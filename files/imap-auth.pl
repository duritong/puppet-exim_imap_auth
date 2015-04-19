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

  # login, if success return 1 (true?) and 0 (false?)
  $res = $server->login( $account => $password );
  $server->close();
  if ( $res ) {
    return 1;
  } else {
    return 0;
  }
}
