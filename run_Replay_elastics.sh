#! /bin/bash
#Which spectrometer 
#spec=$1
#SPEC=$(echo "$spec" | tr '[:lower:]' '[:upper:]')

#Initialize hcana
cd "/home/trottar/Analysis/hcana/"
source "/home/trottar/Analysis/hcana/setup.sh"
cd "/home/trottar/Analysis/hallc_replay"
source "/home/trottar/Analysis/hallc_replay/setup.sh"

#Input run numbers
inputFile="/home/trottar/ResearchNP/ROOTAnalysis/kaonlt_analysis/elastics/inputRuns"

while IFS='' read -r line || [[ -n "$line" ]];
do
    echo "Run number read from file: $line"

#Which run
runNum=$line

#Number of events
numEvts=-1

#Which scripts to run
#script="replay_elastics_hms.C"
script="replay_production_coin.C"

#which commands to run
#runScript="./hcana -l -q \"SCRIPTS/${SPEC}/PRODUCTION/${script}(${runNum},${numEvts})\""
runScript="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script}(${runNum},${numEvts})\""
rootFile="KaonLT_coin_replay_production_${runNum}_${numEvts}.root"

#Excecute 
{

echo "Running ${script}"
echo "Getting ${numEvts} number of events for run ${runNum}"
eval ${runScript}

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "END OF RUN ${runNum}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

}

done < "$inputFile"

