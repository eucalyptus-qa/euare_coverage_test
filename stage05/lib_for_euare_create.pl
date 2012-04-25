#!/usr/bin/perl

use strict;

sub create_account_given_account_and_user_and_target_account{
	my $account = shift @_;
	my $user = shift @_;
	my $target_account = shift @_;

	print "\n";
	print "########################### CREATE-ACCOUNT-GIVEN-ACCOUNT-AND-USER-AND-TARGET-ACCOUNT ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-accountcreate\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-accountcreate -a $target_account\"`;
	print "\n";

	return $out
};

sub create_group_given_account_and_user_and_target_group{
	my $account = shift @_;
	my $user = shift @_;
	my $target_group = shift @_;

	print "\n";
	print "########################### CREATE-ACCOUNT-GIVEN-ACCOUNT-AND-USER-AND-TARGET-GROUP ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-groupcreate\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-groupcreate -g $target_group\"`;
	print "\n";

	return $out
};

sub create_user_given_account_and_user_and_target_user{
	my $account = shift @_;
	my $user = shift @_;
	my $target_user = shift @_;

	print "\n";
	print "########################### CREATE-USER-GIVEN-ACCOUNT-AND-USER-AND-TARGET-USER ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-usercreate\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-usercreate -u $target_user\"`;
	print "\n";

	return $out
};







1;

