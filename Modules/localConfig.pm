package localConfig;



###################################################################################################################################
#
# Copyright 2014 IRD-CIRAD
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
# Intellectual property belongs to IRD, CIRAD and South Green developpement plateform
# Written by Cecile Monat, Christine Tranchant, Ayite Kougbeadjo, Cedric Farcy, Mawusse Agbessi, Marilyne Summo, and Francois Sabot
#
###################################################################################################################################




use strict;
use warnings;
use Exporter;

our @ISA=qw(Exporter);
our @EXPORT=qw($bwa $picard $samtools $GATK $cufflinks $pacBioToCA $cutadapt $fastqc $java $snpEff $toggle $fastxTrimmer $tophat2 $bowtie2Build $bowtieBuild);

#toggle path
our $toggle="/data/projects/Floripalm/STAGE-SOUHILA/TOGGLE/";

#PATH for Mapping on cluster
our $java = "/usr/local/java/latest/bin/java -Xmx12g -jar";

our $bwa = "/usr/local/bin/bwa";
our $picard = "$java /home/sabotf/sources/picard-tools";

our $samtools = "/usr/local/bin/samtools";
our $GATK = "/usr/java/jre1.7.0_51/bin/java -Xmx12g -jar /usr/local/GenomeAnalysisTK-3.3/GenomeAnalysisTK.jar";
our $fastqc = "/usr/local/FastQC/fastqc";

#PATH for Cufflinks bin on cluster

our $cufflinks = "/usr/local/cufflinks-2.2.1.Linux_x86_64/cufflinks";

#Path for pacBioToCa
our $pacBioToCA = tophat_TEST_log.o "/home/sabotf/sources/wgs/Linux-amd64/bin/pacBioToCA";

#Path for CutAdapt
our $cutadapt = "/usr/local/cutadapt-1.2.1/bin/cutadapt";

#Path for SNPeff
our $snpEff="$java /home/sabotf/sources/snpEff/snpEff.jar";


##### FOR RNASEQ analysis
#Path for fastq_trimmer
our $fastxTrimmer="/usr/local/bin/fastx_trimmer";

#Path for tophat2
our $tophat2="/usr/local/tophat-2.0.14/bin/tophat2";

#path for bowtie2-build
our $bowtie2Build="/usr/local/bowtie2-2.2.5/bowtie2-build";

#path for bowtie-build
our $bowtieBuild="/usr/local/bowtie-0.12.9/bowtie-build";





1;
