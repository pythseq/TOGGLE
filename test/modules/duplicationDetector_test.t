#!/usr/bin/perl

###################################################################################################################################
#
# Copyright 2014-2017 IRD-CIRAD-INRA-ADNid
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/> or
# write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.
#
# You should have received a copy of the CeCILL-C license with this program.
#If not see <http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.txt>
#
# Intellectual property belongs to IRD, CIRAD and South Green developpement plateform for all versions also for ADNid for v2 and v3 and INRA for v3
# Version 1 written by Cecile Monat, Ayite Kougbeadjo, Christine Tranchant, Cedric Farcy, Mawusse Agbessi, Maryline Summo, and Francois Sabot
# Version 2 written by Cecile Monat, Christine Tranchant, Cedric Farcy, Enrique Ortega-Abboud, Julie Orjuela-Bouniol, Sebastien Ravel, Souhila Amanzougarene, and Francois Sabot
# Version 3 written by Cecile Monat, Christine Tranchant, Laura Helou, Abdoulaye Diallo, Julie Orjuela-Bouniol, Sebastien Ravel, Gautier Sarah, and Francois Sabot
#
###################################################################################################################################

#Will test if bwa works correctly
use strict;
use warnings;
use Test::More 'no_plan'; #Number of tests, to modify if new tests implemented. Can be changed as 'no_plan' instead of tests=>11 .
use Test::Deep;
use Data::Dumper;
use lib qw(../../modules/);


########################################
#use of duplicationDetector module ok
########################################
use_ok('localConfig') or exit;
use_ok('duplicationDetector') or exit;
can_ok('duplicationDetector','execution');


use localConfig;
use duplicationDetector;

my $vcfData="$toggle/data/testData/vcf/duplicVCF/smallDuplic.vcf";

#########################################
#Remove files and directory created by previous test
#########################################
my $testingDir="$toggle/dataTest/duplicationDetectorTestDir";
my $creatingDirCom="rm -Rf $testingDir ; mkdir -p $testingDir";                                    #Allows to have a working directory for the tests
system($creatingDirCom) and die ("ERROR: $0 : Cannot execute the command $creatingDirCom\n$!\n");

chdir $testingDir or die ("ERROR: $0 : Cannot go into the new directory with the command \"chdir $testingDir\"\n$!\n");


#######################################
#Creating the IndividuSoft.txt file
#######################################
my $creatingCommand="echo \"duplicationDetector\nTEST\" > individuSoft.txt";
system($creatingCommand) and die ("ERROR: $0: Cannot create the individuSoft.txt file with the command $creatingCommand \n$!\n");


#######################################
#Cleaning the logs for the test
#######################################
my $cleaningCommand="rm -Rf duplicationDetector_TEST_log.*";
system($cleaningCommand) and die ("ERROR: $0: Cannot clean the previous log files for this test with the command $cleaningCommand \n$!\n");


##########################################
##### duplicationDetector::execution
##########################################


# execution test
my %optionsHachees = ("-H" => 1);
my $optionsHachees = \%optionsHachees;

# output file
my $bedFileOut=$testingDir."/test.duplicationDetector.bed";

# execution test
is(duplicationDetector::execution($vcfData,$bedFileOut,$optionsHachees),'1',"duplicationDetector::execute - Test for duplicationDetector running");

# expected output test
#Check if files created
my @expectedOutput = ("duplicationDetector_TEST_log.e","duplicationDetector_TEST_log.o","individuSoft.txt","test.duplicationDetector.bed");
my $observedOutput = `ls ./`;
my @observedOutput = split /\n/,$observedOutput;
is_deeply(\@observedOutput,\@expectedOutput,'duplicationDetector::execute - Files created');

# expected content test FileOut
my $expectedLineNumber = "3 $bedFileOut";                                            # structure of the ref file for checking
my $observedLineNumber = `wc -l $bedFileOut`;                                                        # structure of the test file for checking
chomp $observedLineNumber;                                                     # to separate the structure and the name of file
is($observedLineNumber, $expectedLineNumber, "duplicationDetector::execute - output content file Bed");               # TEST IF THE STRUCTURE OF THE FILE OUT IS GOOD

###Test for correct file value of duplicationDetector
#GREP command result
my $grepResult=`grep "359593" $bedFileOut`;
chomp $grepResult;
is($grepResult,"Reference	359593	359695	102	11	1.00",'duplicationDetector::execute - output grep in file Bed');

exit;
