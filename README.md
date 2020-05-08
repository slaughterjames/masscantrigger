#masscantrigger v0.1 - Copyright 2020 James Slaughter,
#This file is part of masscantrigger v0.1.

#masscantrigger v0.1 is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#masscantrigger v0.1 is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with masscantrigger v0.1.  If not, see <http://www.gnu.org/licenses/>.

masscantrigger is a shell script that acts as a wrapper to execute Masscan using the following command:
masscan -p80,161,443,2075,2076,3000,3306,3366,3868,4000,4040,4044,5000,5432,5673,5900,6000,6443,7077,7080,7443,7447,8000,8080,8081,8181,8089,8880,8888,8983,9000,9091,9443,9999,10000,15672 --open -il $Target_file --banners -oG $Output_file

Usage: sudo ./masscantrigger.sh /<target file/> /<output file/>
