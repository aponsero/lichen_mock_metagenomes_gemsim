# lichen_mock_metagenomes_gemsim
Pipeline for the generation of lichen mock communities using GemSim. Parralellize for HPC using PBS scheduler. 
This pipeline simply takes a list of profiles, each of them being a metagenome description and run GemSim on it.

## Requirements

### GemSim
This pipeline requires to download and install [GemSim](https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-13-74) on the HPC. 

## Quick start

### Edit scripts/config.sh file

please modify the

  - GEMSIM= path to GemSim bin directory
  - LIST_PROFILES= list of GemSim profiles to run on
  - GENOMES_DIR= path to directory where the original profiles are stored
  - NB_READS= nb reads to generate
  - MODEL= gemSim model path (relative to GemSim bin directory)
  - PROFILE_DIR= path to profile directory
  - OUT_DIR= path to output directory
  - REL_OUT= path to output directory (relative to GemSim bin directory, as GemSim does not handle absolute paths)

  - MAIL_USER = indicate here your arizona.edu email
  - GROUP = indicate here your group affiliation

You can also modify

  - BIN = change for your own bin directory.
  - MAIL_TYPE = change the mail type option. By default set to "bea".
  - QUEUE = change the submission queue. By default set to "standard".
  
  ### Run pipeline
  
  Run 
  ```bash
  ./submit.sh
  ```
  This command will place one job in queue.
  

