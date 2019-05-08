#------------------------------------------------------------------------------#
#                   OFFICIAL DEBIAN REPOS                    
#------------------------------------------------------------------------------#

###### Debian Main Repos
deb http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing main contrib non-free

deb http://deb.debian.org/debian/ testing-updates main contrib non-free
deb-src http://deb.debian.org/debian/ testing-updates main contrib non-free

deb http://deb.debian.org/debian-security testing/updates main
deb-src http://deb.debian.org/debian-security testing/updates main

#------------------------------------------------------------------------------#
#                      UNOFFICIAL  REPOS                       
#------------------------------------------------------------------------------#

###### 3rd Party Binary Repos
###Debian Multimedia
deb [arch=amd64,i386] http://www.deb-multimedia.org buster main non-free

###Skype
deb [arch=amd64] https://repo.skype.com/deb stable main

###Sublime Text
deb https://download.sublimetext.com/ apt/stable/

###Teamviewer
deb http://linux.teamviewer.com/deb stable main

###Visual Studio Code
deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main

deb http://download.virtualbox.org/virtualbox/debian stretch contrib
deb [arch=amd64] https://download.docker.com/linux/debian buster stable


#setup these servers
apt install curl wget apt-transport-https dirmngr
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb && dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
wget -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 72B97FD1D9672C93
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg


#dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
screen ~/.dropbox-dist/dropboxd

def install_ruby_full
	essentials = `ruby-mysql2 default-libmysqlclient-dev`
end


def aseprite
	download = `wget http://ftp.us.debian.org/debian/pool/main/a/aseprite/aseprite_1.1.6+ds-1+b1_amd64.deb`
	install = `sudo dpkg -i aseprite_1.1.6+ds-1+b1_amd64.deb`
	clean = `rm -rf aseprite_1.1.6+ds-1+b1_amd64.deb`
end

def audacious
	install = `apt-get install audacious`
	puts install
end

def install_basics
	basics = `apt-get install curl wget vim ranger irssi weechat guake apt-build nginx ncdu links2 filezilla zip ncdu git`
end

def install_extras
	extras = `sudo apt-get install code sublime-text virtualbox teamviewer docker-ce`
end
#mysql gem ruby reqs for debian

def install_retro_term
	download = `cd roots && git clone --recursive https://github.com/Swordfish90/cool-retro-term.git && cd cool-retro-term && qmake && make`
	puts "retro term compiled and stoof"
end

def buppr
	makefile = `GZIP=-9 tar cvzf Projects.tar.gz ~/Projects`
end

def bupdocs
	makefile = `GZIP=-9 tar cvzf Documents.tar.gz ~/Documents`
end

def bupuser
	makefile = `GZIP=-9 tar cvzf user.tar.gz ~/.ssh ~/Desktop ~/Documents ~/Projects ~/Pictures ~/Videos && mv user.tar.gz /home/captain/sync/bup/`
end

def buproots
	makefile = `GZIP=-9 tar cvzf Documents.tar.gz ~/roots`
end

def remake_roots
	coprine = `wget <file.ext> -O /path/to/folder/file.ext`
end

def excuse
	puts `curl -s http://developerexcuses.com | perl -ne 'print "$1\n" if /333;"\>([^<]+)/ '`
	#It would have taken twice as long to build it properly
	#It probably won't happen again
	#Did you check for a virus on your system?
end




def install_docker
	#install dependencies needed
	#add docker repo 
	#apt update
	#install docker-ce
	puts "echo docker repos apt"
end

def add_docker_user (username)
	run = `usermode -aG docker #{username}`
	puts run # and echo to log
end

# firefox dev
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make

# chm files viewer = xchm

def bench