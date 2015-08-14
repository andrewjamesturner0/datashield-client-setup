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

# Create an Renviron file to tell R where to install/find the user's libraries
echo "R_LIBS_USER=$R_LIBS_USER" > "/home/$USER/.Renviron"
chown $USER:$USER "/home/$USER/.Renviron"

# Create the location for the user's libraries
# Note: this is done as the user, not root
sudo -u $USER mkdir -p "$R_LIBS_USER"

# Add the correct library location into the R install script
sed -i "s|\@LIB\@|$R_LIBS_USER|" ../R/install-r-libs.R

# Run the R install script
# Note: this is done as the user, not root
sudo -u $USER Rscript ../R/install-r-libs.R
