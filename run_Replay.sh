#! /bin/bash

#Which spectrometer 
#spec=$1
#SPEC=$(echo "$spec" | tr '[:lower:]' '[:upper:]')

#Which run
runNum=$1

#Which run type (e.g. elastics, lumiscan,production)
rtype=$2
RTYPE=$(echo "$rtype" | tr '[:lower:]' '[:upper:]')

#Number of events
numEvts=-1

#Initialize enviroment
export OSRELEASE="Linux_CentOS7.2.1511-x86_64-gcc5.2.0"
source /site/12gev_phys/softenv.sh 2.0

#Initialize hcana
cd "/home/trottar/Analysis/hcana/"
source "/home/trottar/Analysis/hcana/setup.sh"
cd "/home/trottar/Analysis/hallc_replay"
source "/home/trottar/Analysis/hallc_replay/setup.sh"

#Which scripts to run
if [ ${rtype} = "elastics" ]; then
    script_hms="replay_production_hms_coin.C"
    script_shms="replay_production_shms_coin.C"
    #which commands to run
    runScript_hms="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script_hms}(${runNum},${numEvts})\""
    runScript_shms="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script_shms}(${runNum},${numEvts})\""
    #rootFile_hms="KaonLT_coin_replay_production_hms_${runNum}_${numEvts}.root"
    #rootFile_shms="KaonLT_coin_replay_production_shms_${runNum}_${numEvts}.root"
    #Excecute 
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RTYPE} CHOSEN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
    echo "Getting ${numEvts} number of events for run ${runNum}"
    echo ""
    echo "HMS is being analyzed"
    echo " "
    echo "Running ${script_hms}"
    eval ${runScript_hms}
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "END OF HMS RUN ${runNum}"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "SHMS is being analyzed"
    echo " "
    echo "Running ${script_shms}"
    eval ${runScript_shms}
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "END OF SHMS RUN ${runNum}"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
if [ ${rtype} = "lumiscan" ]; then
    script="replay_luminosity.C"
    #which commands to run
    runScript="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script}(${runNum},${numEvts})\""
    #rootFile="KaonLT_coin_replay_production_${runNum}_${numEvts}.root"
    #Excecute 
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RTYPE} CHOSEN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
    echo "Getting ${numEvts} number of events for run ${runNum}"
    echo "Running ${script}"
    eval ${runScript}
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "END OF RUN ${runNum}"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
if [ ${rtype} = "production" ]; then
    script="replay_production_coin.C"
    #which commands to run
    runScript="/home/trottar/Analysis/hallc_replay/hcana -l -q \"UTIL_KAONLT/scripts_Replay/${script}(${runNum},${numEvts})\""
    #rootFile="KaonLT_Luminosity_coin_replay_production_${runNum}_${numEvts}.root"
    #Excecute 
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RTYPE} CHOSEN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
    echo "Getting ${numEvts} number of events for run ${runNum}"
    echo "Running ${script}"
    eval ${runScript}
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "END OF RUN ${runNum}"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
