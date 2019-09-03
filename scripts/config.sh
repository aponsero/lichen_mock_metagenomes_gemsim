export CWD=$PWD
# where programs are
export GEMSIM="/rsgrps/bhurwitz/alise/tools/GemSIM_v1.6"
# where the dataset to prepare is
export LIST_PROFILES="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/mock_lichen/mock2/profiles/list_profile.list"
export GENOMES_DIR="../../my_data/Nostoc_project/mock_lichen/mock2/genomes"
#needs to be relative to GemSim dir
export NB_READS="5000" #nb reads to generate
export MODEL="models/ill100v4_p.gzip"
export SCRIPT_DIR="$PWD/scripts"
#output
export PROFILE_DIR="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/mock_lichen/mock2/profiles"
export OUT_DIR="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/mock_lichen/mock2/test"
export REL_OUT="../../my_data/Nostoc_project/mock_lichen/mock2/test"
# User informations
export QUEUE="standard"
export GROUP="bhurwitz"
export MAIL_USER="aponsero@email.arizona.edu"
export MAIL_TYPE="bea"

#
# --------------------------------------------------
function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

# --------------------------------------------------
function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
