#!/usr/bin/perl
use strict;
use Cwd;

require "./lib_for_euare.pl";
require "./lib_for_euare_policy.pl";
require "./lib_for_euare_teardown.pl";

require "./lib_for_euare_policy_02.pl";
require "./lib_for_euare_list.pl";

$ENV{'EUCALYPTUS'} = "/opt/eucalyptus";


################################################## CONFIRM LIST OPS . PL #########################################################


print "\n";
print "########################### READ INPUT FILE  ##############################\n";

read_input_file();

my $clc_ip = $ENV{'QA_CLC_IP'};
my $source_lst = $ENV{'QA_SOURCE'};

if( $clc_ip eq "" ){
	print "[ERROR]\tCouldn't find CLC's IP !\n";
	exit(1);
};

if( $source_lst eq "PACKAGE" || $source_lst eq "REPO" ){
        $ENV{'EUCALYPTUS'} = "";
};



###
### check account name
###

print "\n";
print "########################### ACCOUNT INFORMATION  ##############################\n";

my $account_name = "euare-policy-test-account";
my $group_name = "group00";
my $user_name = "user00";

my $group_count = 3;
my $user_count = 3;


print "\n";
print "TEST ACCOUNT NAME [$account_name]\n";
print "TEST GROUP NAME [$group_name]\n";
print "TEST USER NAME [$user_name]\n";
print "\n";
print "TEST GROUP COUNT [$group_count]\n";
print "TEST USER COUNT [$user_count]\n";
print "\n";
print "\n";

print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Verify the LIST Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

###
### list all accounts
###
my $list = list_all_accounts_given_account_and_user($account_name, $user_name);
print "\n";

print "list_all_accounts_given_account_and_user(\"$account_name\", \"$user_name\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### list all groups
###
$list = list_all_groups_given_account_and_user($account_name, $user_name);
print "\n";

print "list_all_groups_given_account_and_user(\"$account_name\", \"$user_name\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### list all users
###
$list = list_all_users_given_account_and_user($account_name, $user_name);
print "\n";

print "list_all_users_given_account_and_user(\"$account_name\", \"$user_name\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### list all group policies for all groups
###
for( my $i=0; $i<$group_count; $i++){
	my $this_group = "group" . sprintf("%02d", $i);
	$list = list_all_group_policies_given_account_and_user_and_target_group($account_name, $user_name, $this_group);
	print "\n";

	print "list_all_group_policies_given_account_and_user_and_target_group(\"$account_name\", \"$user_name\", \"$this_group\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
	sleep(2);
};
print "\n";

###
### list all user policies for all users
###
for( my $i=0; $i<$user_count; $i++){
	my $this_user = "user" . sprintf("%02d", $i);

	$list = list_all_user_policies_given_account_and_user_and_target_user($account_name, $user_name, $this_user);
	print "\n";

	print "list_all_user_policies_given_account_and_user_and_target_user(\"$account_name\", \"$user_name\", \"$this_user\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
	sleep(2);
};
print "\n";

###
### list all users in group for all groups
###
for( my $i=0; $i<$group_count; $i++){
	my $this_group = "group" . sprintf("%02d", $i);
	$list = list_all_users_in_group_given_account_and_user_and_target_group($account_name, $user_name, $this_group);
	print "\n";

	print "list_all_users_in_group_given_account_and_user_and_target_group(\"$account_name\", \"$user_name\", \"$this_group\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
	sleep(2);
};
print "\n";

###
### list all groups in users
###
for( my $i=0; $i<$user_count; $i++){
	my $this_user = "user" . sprintf("%02d", $i);
	$list = list_all_groups_in_user_given_account_and_user_and_target_user($account_name, $user_name, $this_user);
	print "\n";

	print "list_all_groups_in_user_given_account_and_user_and_target_user(\"$account_name\", \"$user_name\", \"$this_user\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
	sleep(2);
};
print "\n";

print "\n";
print "\n";
print "\n";

print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Summarize the LIST Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

print "List all accounts -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "List all groups -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "List all users -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "List all group policies for all groups -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "List all user policies for all users -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "List all users in group for all groups -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "List all groups in user for all users -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "\n";
print "\n";
print "\n";


###
### End of Script
###

print "\n";
print "[TEST_REPORT]\tCONFIRM LIST OPS HAS BEEN COMPLETED\n";
print "\n";

exit(0);

1;


