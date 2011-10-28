use Net::IMAP::Simple::SSL;

sub imapLogin {
   my $host = shift;
   my $account = shift;
   my $password = shift;

   # open a connection to the IMAP server
   if (! ($server = Net::IMAP::Simple::SSL->new($host))) {
      return 0;
   }

   # login, if success return 1 (true?) and 0 (false?)
   if ($server->login( $account => $password )) {
      return 1;
   } else {
      return 0;
   }
   $server->close();
}