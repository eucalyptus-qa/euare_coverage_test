#!/usr/bin/perl

use strict;

sub add_user_to_group_given_account_and_user_and_target_group_and_user{
	my $account = shift @_;
	my $user = shift @_;
	my $target_group = shift @_;
	my $target_user = shift @_;

	print "\n";
	print "########################### ADD-USER-TO-GROUP-GIVEN-ACCOUNT-AND-USER-AND-TARGET-GROUP-AND-USER ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-groupadduser\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-groupadduser -g $target_group -u $target_user\"`;
	print "\n";

	return $out
};

sub add_policy_to_group_given_account_and_user_and_target_group_and_policy_and_effect{
	my $account = shift @_;
	my $user = shift @_;
	my $target_group = shift @_;
	my $target_policy = shift @_;
	my $target_effect = shift @_;

	print "\n";
	print "########################### ADD-POLICY-TO-GROUP-GIVEN-ACCOUNT-AND-USER-AND-TARGET-GROUP-AND-POLICY-AND-EFFECT ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-groupaddpolicy\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-groupaddpolicy -g $target_group -p $target_policy -e $target_effect\"`;
	print "\n";

	return $out
};

sub add_policy_to_user_given_account_and_user_and_target_user_and_policy_and_effect{
	my $account = shift @_;
	my $user = shift @_;
	my $target_user = shift @_;
	my $target_policy = shift @_;
	my $target_effect = shift @_;

	print "\n";
	print "########################### ADD-POLICY-TO-GROUP-GIVEN-ACCOUNT-AND-USER-AND-TARGET-USER-AND-POLICY-AND-EFFECT ##############################\n";

	print "$ENV{'QA_CLC_IP'} :: euare-useraddpolicy\n";
	my $out = `ssh -o ServerAliveInterval=1 -o ServerAliveCountMax=5 -o StrictHostKeyChecking=no root\@$ENV{'QA_CLC_IP'} \"source /root/cred_depot/$account/$user/eucarc; euare-useraddpolicy -u $target_user -p $target_policy -e $target_effect\"`;
	print "\n";

	return $out
};







1;

