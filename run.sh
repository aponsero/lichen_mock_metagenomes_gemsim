#!/bin/sh
set -u
#
# Checking args
#

source scripts/config.sh

if [[ ! -f "$LIST_PROFILES" ]]; then
   echo "$LIST_PROFILES does not exist. Please provide a file containing sample names to process. Job terminated."
    exit 1
fi

export NUM_FILES=$(wc -l < "$LIST_PROFILES")

if [[ $NUM_FILES -eq 0 ]]; then
  echo "Empty sample list, please correct config file. Job terminated."
  exit 1
fi

#
# Job submission
#

PREV_JOB_ID=""
ARGS="-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE"

#
## 01-run gemSim
#

PROG="01-run-gemSim"
export STDERR_DIR="$SCRIPT_DIR/err/$PROG"
export STDOUT_DIR="$SCRIPT_DIR/out/$PROG"
init_dir "$STDERR_DIR" "$STDOUT_DIR"


echo "launching $SCRIPT_DIR/gemSim.sh"

JOB_ID=`qsub $ARGS -v GEMSIM,LIST_PROFILES,GENOMES_DIR,NB_READS,MODEL,PROFILE_DIR,OUT_DIR,REL_OUT,STDERR_DIR,STDOUT_DIR -N run_gemSim -e "$STDERR_DIR" -o "$STDOUT_DIR" -J 1-$NUM_FILES $SCRIPT_DIR/run_GemSim.sh`

if [ "${JOB_ID}x" != "x" ]; then
      echo Job: \"$JOB_ID\"
else
      echo Problem submitting job. Job terminated
fi
echo "job successfully submited"

