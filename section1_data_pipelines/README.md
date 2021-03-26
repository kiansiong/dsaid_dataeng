# Section 1: Data Pipelines


## Setup directory
1. Ensure that environment is setup and dependencies in requirements.txt (in parent directory) are installed.
2. Download repository
3. Run `chmod 750 setup.sh` followed by `./setup.sh`

## Crontab setup
Step to setup Crontab is out of the scope for this guide.
Refer to `crontab.bak` file for the setup done.

_Assumptions: File is available in the input folder at 1am everyday._


## Input folder
Input data to be dropped in `/data` folder.
The program takes any `.csv` files dropped into this folder for processing.


## Output folder
Processed files will be dropped in the `/processed` folder with the following naming convention:
    `<original file name>_cleaned.csv`
