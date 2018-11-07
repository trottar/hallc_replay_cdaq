#! /bin/bash

#Which spectrometer 
#spec=$1
#SPEC=$(echo "$spec" | tr '[:lower:]' '[:upper:]')

#Which run
runNum=$1

#Number of events
numEvts=10000

#Initialize enviroment
export OSRELEASE="Linux_CentOS7.2.1511-x86_64-gcc5.2.0"
source /site/12gev_phys/softenv.sh 2.0

#Initialize hcana
cd "/home/trottar/Analysis/hcana/"
source "/home/trottar/Analysis/hcana/setup.sh"
cd "/home/trottar/Analysis/hallc_replay"
source "/home/trottar/Analysis/hallc_replay/setup.sh"

#Which scripts to run
script="replay_production_coin.C"

#which commands to run
#runScript="./hcana -l -q \"SCRIPTS/${SPEC}/PRODUCTION/${script}(${runNum},${numEvts})\""
runScript="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script}(${runNum},${numEvts})\""
#rootFile="KaonLT_coin_replay_production_${runNum}_${numEvts}.root"

#Excecute 
{
echo "Getting ${numEvts} number of events for run ${runNum}"
echo "Running ${script}"
eval ${runScript}

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "END OF RUN ${runNum}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

}


