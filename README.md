# datashield-client-setup
Scripts to set up a datashield client


There are four scripts to install the following components:

* The latest verison of R
* The datashield client R packages, including dependencies
* The devtools R package
* RStudio server (browser based version of RStudio)

**If you do not want either devtools or RStudio Server, then delete the lines relevant
lines from the array in `install.sh`**


## Usage

##### 1. Download the repo

    $ git clone https://github.com/datashield/datashield-client-setup.git
    $ cd datashield-client-setup

##### 2. Edit the variables in `scripts/common` to reflect your username and the location for storing your installed R libraries.

##### 3. Optionally, edit `install.sh` to remove items (e.g. RStudio Server).

##### 4. Install as root

    $ sudo su
    # ./install.sh
