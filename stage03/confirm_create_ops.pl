#!/usr/bin/perl
use strict;
use Cwd;

require "./lib_for_euare.pl";
require "./lib_for_euare_policy.pl";
require "./lib_for_euare_teardown.pl";

require "./lib_for_euare_policy_02.pl";
require "./lib_for_euare_list.pl";
require "./lib_for_euare_create.pl";

$ENV{'EUCALYPTUS'} = "/opt/eucalyptus";


################################################## CREATE LIST OPS . PL #########################################################


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
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Execute the CREATE Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

###
### create account
###
my $target_account = $account_name . "-dup";
my $list = create_account_given_account_and_user_and_target_account($account_name, $user_name, $target_account);
print "\n";

print "create_account_given_account_and_user_and_target_account(\"$account_name\", \"$user_name\", \"$target_account\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### create group
###
my $target_group = $group_name . "-dup";
$list = create_group_given_account_and_user_and_target_group($account_name, $user_name, $target_group);
print "\n";

print "create_group_given_account_and_user_and_target_group(\"$account_name\", \"$user_name\", \"$target_group\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### create user
###
my $target_user = $user_name . "-dup";
$list = create_user_given_account_and_user_and_target_user($account_name, $user_name, $target_user);
print "\n";

print "create_user_given_account_and_user_and_target_user(\"$account_name\", \"$user_name\", \"$target_user\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

print "\n";
print "\n";
print "\n";


print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Verify the CREATE Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

###
### list all accounts
###
my $list = list_all_accounts_given_account_and_user("eucalyptus", "admin");
print "\n";

print "list_all_accounts_given_account_and_user(\"eucalyptus\", \"admin\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### list all groups
###
$list = list_all_groups_given_account_and_user($account_name, "admin");
print "\n";

print "list_all_groups_given_account_and_user(\"$account_name\", \"admin\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

sleep(2);

###
### list all users
###
$list = list_all_users_given_account_and_user($account_name, "admin");
print "\n";

print "list_all_users_given_account_and_user(\"$account_name\", \"admin\"):\n";
print "$list\n";
print "###END###\n";
print "\n";
print "\n";

print "\n";
print "\n";
print "\n";

print "\n";
print "+++++++++++++++++++++++++++++++++++++++++++++++++++ Summarize the CREATE Ops +++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
print "\n";

print "\n";
print "\n";
print "\n";

print "Create account \'$target_account\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "Create group \'$target_group\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "Create user \'$target_user\' -- using Credentials [Account \'$account_name\', User \'$user_name\']\n";
print "\n";

print "List all accounts -- using Credentials [Account \'eucalyptus\', User \'admin\']\n";
print "List all groups -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "List all users -- using Credentials [Account \'$account_name\', User \'admin\']\n";
print "\n";

print "\n";
print "\n";
print "\n";


###
### End of Script
###

print "\n";
print "[TEST_REPORT]\tCONFIRM CREATE OPS HAS BEEN COMPLETED\n";
print "\n";

exit(0);

1;


