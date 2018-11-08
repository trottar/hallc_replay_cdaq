#! /bin/bash

#Which spectrometer 
#spec=$1
#SPEC=$(echo "$spec" | tr '[:lower:]' '[:upper:]')

#Which run
runNum=$1

#Which run type (e.g. elastics, lumiscan)
rtype=$2

#Number of events
numEvts=10000

#Initialize enviroment
#export OSRELEASE="Linux_CentOS7.2.1511-x86_64-gcc5.2.0"
#source /site/12gev_phys/softenv.sh 2.0

#Initialize hcana
cd "../hcana/"
source "../hcana/setup.sh"
cd "../hallc_replay"
source "../hallc_replay/setup.sh"

#Which scripts to run
if [ ${rtype} = "elastics" ]; then
    script="replay_production_coin.C"
    #script="replay_production_coin_hElec_pProt.C"
fi
if [ ${rtype} = "lumiscan" ]; then
    script="replay_luminosity.C"
fi

#which commands to run
#runScript="/home/trottar/Analysis/hallc_replay/hcana -l -q \"SCRIPTS/COIN/PRODUCTION/${script}(${runNum},${numEvts})\""
runScript="./hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script}(${runNum},${numEvts})\""
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
