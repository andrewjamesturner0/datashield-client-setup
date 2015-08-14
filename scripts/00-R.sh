#!/bin/bash
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# exit on errors
set -euo pipefail


source common
check_root

#
# Add a repo for the latest version of R. (The version of R packaged for ubuntu is quite old.)
# 
# Here 'trusty' refers to ubuntu 14.04 -- If using a different version, replace
# trusty as necessary (e.g. 12.04 = precise)
#
if [ $(grep -c '^deb http://www.stats.bris.ac.uk/R/bin/linux/ubuntu trusty/' /etc/apt/sources.list) -eq 0 ]; then
    sh -c 'echo "deb http://www.stats.bris.ac.uk/R/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
fi

apt-get update
apt-get install -y r-base r-base-dev libcurl4-openssl-dev
