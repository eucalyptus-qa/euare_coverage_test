#!/usr/bin/perl
use strict;
use Cwd;

require "./lib_for_euare.pl";
require "./lib_for_euare_policy.pl";
require "./lib_for_euare_teardown.pl";

require "./lib_for_euare_policy_02.pl";
require "./lib_for_euare_list.pl";
require "./lib_for_euare_add.pl";

$ENV{'EUCALYPTUS'} = "/opt/eucalyptus";


################################################## CONFIRM ADD OPS . PL #########################################################


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
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Execute the ADD Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

###
### add $user_name to group02
###
my $target_group = "group02";
my $target_user = $user_name;
my $list = add_user_to_group_given_account_and_user_and_target_group_and_user($account_name, $user_name, $target_group, $target_user);
print "\n";

print "add_user_to_group_given_account_and_user_and_target_group_and_user(\"$account_name\", \"$user_name\", \"$target_group\", \"$target_user\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### add user02 to group02
###
$target_group = "group02";
$target_user = "user02";
$list = add_user_to_group_given_account_and_user_and_target_group_and_user($account_name, $user_name, $target_group, $target_user);
print "\n";

print "add_user_to_group_given_account_and_user_and_target_group_and_user(\"$account_name\", \"$user_name\", \"$target_group\", \"$target_user\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### add policy to group01
###
$target_group = "group01";
my $target_policy = "test.policy";
my $target_effect = "Allow";
$list = add_policy_to_group_given_account_and_user_and_target_group_and_policy_and_effect($account_name, $user_name, $target_group, $target_policy, $target_effect);
print "\n";

print "add_policy_to_group_given_account_and_user_and_target_group_and_policy_and_effect(\"$account_name\", \"$user_name\", \"$target_group\", \"$target_policy\", \"$target_effect\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### add policy to user02
###
$target_user = "user02";
$target_policy = "test.policy";
$target_effect = "Allow";
$list = add_policy_to_user_given_account_and_user_and_target_user_and_policy_and_effect($account_name, $user_name, $target_user, $target_policy, $target_effect);
print "\n";

print "add_policy_to_user_given_account_and_user_and_target_user_and_policy_and_effect(\"$account_name\", \"$user_name\", \"$target_user\", \"$target_policy\", \"$target_effect\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

print "\n";
print "\n";
print "\n";


print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Verify the ADD Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";
###
### Execute below command as "admin"
###

###
### list all users in group for all groups
###
for( my $i=0; $i<$group_count; $i++){
	my $this_group = "group" . sprintf("%02d", $i);
	$list = list_all_users_in_group_given_account_and_user_and_target_group($account_name, "admin", $this_group);
	print "\n";

	print "list_all_users_in_group_given_account_and_user_and_target_group(\"$account_name\", \"admin\", \"$this_group\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
};
print "\n";

###
### list all groups in user
###
for( my $i=0; $i<$user_count; $i++){
	my $this_user = "user" . sprintf("%02d", $i);
	$list = list_all_groups_in_user_given_account_and_user_and_target_user($account_name, "admin", $this_user);
	print "\n";

	print "list_all_groups_in_user_given_account_and_user_and_target_user(\"$account_name\", \"admin\", \"$this_user\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
};
print "\n";


###
### list all group policies for all groups
###
for( my $i=0; $i<$group_count; $i++){
	my $this_group = "group" . sprintf("%02d", $i);
	$list = list_all_group_policies_given_account_and_user_and_target_group($account_name, "admin", $this_group);
	print "\n";

	print "list_all_group_policies_given_account_and_user_and_target_group(\"$account_name\", \"admin\", \"$this_group\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
};
print "\n";

###
### list all user policies for all users
###
for( my $i=0; $i<$user_count; $i++){
	my $this_user = "user" . sprintf("%02d", $i);

	$list = list_all_user_policies_given_account_and_user_and_target_user($account_name, "admin", $this_user);
	print "\n";

	print "list_all_user_policies_given_account_and_user_and_target_group(\"$account_name\", \"admin\", \"$this_user\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
};
print "\n";



print "\n";
print "\n";
print "\n";


print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Summarize the ADD Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

print "Add user \'$user_name\' to group \'group02\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "Add user \'user02\' to group \'group02\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "Add policy \'test.policy\' to group \'group01\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "Add policy \'test.policy\' to user \'user02\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";


print "List all users in group for all groups -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all groups in user for all users -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all policies in group for all groups -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all policies in user for all users -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "\n";

print "\n";
print "\n";
print "\n";



###
### End of Script
###

print "\n";
print "[TEST_REPORT]\tCONFIRM ADD OPS HAS BEEN COMPLETED\n";
print "\n";

exit(0);

1;


