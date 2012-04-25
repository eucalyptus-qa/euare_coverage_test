#!/usr/bin/perl
use strict;
use Cwd;

require "./lib_for_euare.pl";
require "./lib_for_euare_policy.pl";
require "./lib_for_euare_teardown.pl";

require "./lib_for_euare_policy_02.pl";
require "./lib_for_euare_list.pl";
require "./lib_for_euare_delete.pl";

$ENV{'EUCALYPTUS'} = "/opt/eucalyptus";


################################################## CONFIRM DELETE OPS . PL #########################################################


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
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Execute the DELETE Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

###
### delete user policy
###
my $target_user = "user01";
my $target_policy = "fullaccess.policy";
my $list = delete_user_policy_given_account_and_user_and_target_user_and_policy($account_name, $user_name, $target_user, $target_policy);
print "\n";

print "delete_user_policy_given_account_and_user_and_target_user_policy(\"$account_name\", \"$user_name\", \"$target_user\", \"$target_policy\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### delete user 
###
$target_user = "user02";
$list = delete_user_given_account_and_user_and_target_user($account_name, $user_name, $target_user);
print "\n";

print "delete_user_given_account_and_user_and_target_user(\"$account_name\", \"$user_name\", \"$target_user\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### delete group policy
###
my $target_group = "group01";
$target_policy = "fullaccess.policy";
$list = delete_group_policy_given_account_and_user_and_target_group_and_policy($account_name, $user_name, $target_group, $target_policy);
print "\n";

print "delete_group_policy_given_account_and_user_and_target_group_and_policy(\"$account_name\", \"$user_name\", \"$target_group\", \"$target_policy\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### delete group 
###
$target_group = "group02";
$list = delete_group_given_account_and_user_and_target_group($account_name, $user_name, $target_group);
print "\n";

print "delete_group_given_account_and_user_and_target_group(\"$account_name\", \"$user_name\", \"$target_group\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### delete account
###
my $target_account = $account_name;
$list = delete_account_given_account_and_user_and_target_account($account_name, $user_name, $target_account);
print "\n";

print "delete_account_given_account_and_user_and_target_account(\"$account_name\", \"$user_name\", \"$target_account\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";


print "\n";
print "\n";
print "\n";


print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Verify the DELETE Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

###
### list all accounts
###
$list = list_all_accounts_given_account_and_user("eucalyptus", "admin");
print "\n";

print "list_all_accounts_given_account_and_user(\"eucalyptus\", \"admin\"):\n";
print "$list\n";
print "###END###\n";
print "\n";


###
### Execute below command as "admin"
###


###
### list all users in account
###
$list = list_all_users_given_account_and_user($account_name, "admin");
print "\n";

print "list_all_users_given_account_and_user(\"$account_name\", \"admin\"):\n";
print "$list\n";
print "###END###\n";
print "\n";

my $user_list = get_list_of_users($list);
my @user_array = split(" ", $user_list);

###
### list all user policies for all users
###
foreach my $this_user (@user_array){
	$list = list_all_user_policies_given_account_and_user_and_target_user($account_name, "admin", $this_user);
	print "\n";

	print "list_all_user_policies_given_account_and_user_and_target_user(\"$account_name\", \"admin\", \"$this_user\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
};
print "\n";


###
### list all groups in account
###
$list = list_all_groups_given_account_and_user($account_name, "admin");
print "\n";

print "list_all_groups_given_account_and_user(\"$account_name\", \"admin\"):\n";
print "$list\n";
print "###END###\n";
print "\n";

my $group_list = get_list_of_groups($list);
my @group_array = split(" ", $group_list);


###
### list all group policies for all groups
###
foreach my $this_group (@group_array){
	$list = list_all_group_policies_given_account_and_user_and_target_group($account_name, "admin", $this_group);
	print "\n";

	print "list_all_group_policies_given_account_and_user_and_target_group(\"$account_name\", \"admin\", \"$this_group\"):\n";
	print "$list\n";
	print "###END###\n";
	print "\n";
};
print "\n";

print "\n";
print "\n";
print "\n";

print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Summarize the DELETE Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

print "Delete user policy \'fullaccess.policy\' from user \'user01\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "Delete user \'user02\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "Delete group policy \'fullaccess.policy\' from group \'group01\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "Delete group \'group02\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "Delete account \'$account_name\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "\n";
print "List all accounts -- using Credentials [Account \'eucalyptus\', User \'admin\']\n";
print "List all users -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all policies in user for all users -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all groups -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all policies in group for all groups -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "\n";

print "\n";
print "\n";
print "\n";


###
### End of Script
###

print "\n";
print "[TEST_REPORT]\tCONFIRM DELETE OPS HAS BEEN COMPLETED\n";
print "\n";

exit(0);

1;


