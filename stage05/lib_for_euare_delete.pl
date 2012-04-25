#!/usr/bin/perl

use strict;

sub delete_user_policy_given_account_and_user_and_target_user_and_policy{
	my $account = shift @_;
	my $user = shift @_;
	my $target_user = shift @_;
	my $target_policy = shift @_;

	print "\n";
	print "########################### DELETE-USER-POLICY-GIVEN-ACCOUNT-AND-USER-AND-TARGET-USER-AND-POLICY ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-userdelpolicy\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-userdelpolicy -u $target_user -p $target_policy\"`;
	print "\n";

	return $out
};

sub delete_user_given_account_and_user_and_target_user{
	my $account = shift @_;
	my $user = shift @_;
	my $target_user = shift @_;

	print "\n";
	print "########################### DELETE-USER-GIVEN-ACCOUNT-AND-USER-AND-TARGET-USER ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-userdel\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-userdel -u $target_user -R\"`;
	print "\n";

	return $out
};

sub delete_group_policy_given_account_and_user_and_target_group_and_policy{
	my $account = shift @_;
	my $user = shift @_;
	my $target_group = shift @_;
	my $target_policy = shift @_;

	print "\n";
	print "########################### DELETE-GROUP-POLICY-GIVEN-ACCOUNT-AND-USER-AND-TARGET-GROUP-AND-POLICY ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-groupdelpolicy\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-groupdelpolicy -g $target_group -p $target_policy\"`;
	print "\n";

	return $out
};

sub delete_group_given_account_and_user_and_target_group{
	my $account = shift @_;
	my $user = shift @_;
	my $target_group = shift @_;

	print "\n";
	print "########################### DELETE-GROUP-GIVEN-ACCOUNT-AND-USER-AND-TARGET-GROUP ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-groupdel\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-groupdel -g $target_group -R\"`;
	print "\n";

	return $out
};

sub delete_account_given_account_and_user_and_target_account{
	my $account = shift @_;
	my $user = shift @_;
	my $target_account = shift @_;

	print "\n";
	print "########################### DELETE-ACCOUNT-GIVEN-ACCOUNT-AND-USER-AND-TARGET-ACCOUNT ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-accountdel\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-accountdel -a $target_account -r\"`;
	print "\n";

	return $out
};



1;

