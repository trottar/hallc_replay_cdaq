#! /bin/bash
#Which spectrometer 
#spec=$1
#SPEC=$(echo "$spec" | tr '[:lower:]' '[:upper:]')

#Which run
runNum=$1

#Number of events
numEvts=-1

#Initialize hcana
cd "/home/trottar/Analysis/hcana/"
source "/home/trottar/Analysis/hcana/setup.sh"
cd "/home/trottar/Analysis/hallc_replay"
source "/home/trottar/Analysis/hallc_replay/setup.sh"

#Which scripts to run
#script="replay_elastics_hms.C"
script="replay_luminosity.C"

#which commands to run
#runScript="./hcana -l -q \"SCRIPTS/${SPEC}/PRODUCTION/${script}(${runNum},${numEvts})\""
runScript="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script}(${runNum},${numEvts})\""
#rootFile="KaonLT_Luminosity_coin_replay_production_${runNum}_${numEvts}.root"

#Excecute 
{

echo "Running ${script}"
echo "Getting ${numEvts} number of events for run ${runNum}"
eval ${runScript}

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "END OF RUN ${runNum}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

}
