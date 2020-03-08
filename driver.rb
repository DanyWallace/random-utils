#!/home/jett/.rvm/rubies/ruby-2.6.3/bin/ruby
# frozen_string_literal: true

# install_gems = `gem install digest-whirlpool httparty mechanize`

require 'mechanize'
require 'httparty'

# random generatos -------------------------------------------
#------------------------------------------------------------

def whirlgen(maxlength = 11)
  require 'digest/whirlpool'
  
  @maxlength = maxlength # max size is actually 128 until idk
  @maxlength = ARGV[1].to_i if ARGV[1]
  holdabc = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
  string = (0..27).map { holdabc[rand(holdabc.length)] }.join
  stringwhirled = Digest::Whirlpool.hexdigest(string)
  puts stringwhirled[0..@maxlength - 1]
end

def truerandom(maxlength = 15)
  # maxlength = ARGV[1]
  fetcher = Mechanize.new
  fetch = fetcher.get("https://www.random.org/strings/?num=1&len=#{maxlength}&digits=on&upperalpha=on&loweralpha=on&format=html&rnd=new")
  result = fetch.parser.xpath('/html/body/div/pre').text
  print text[1..maxlength]
end

# fun
#

def excuse
  puts `curl -s http://developerexcuses.com | perl -ne 'print "$1\n" if /333;"\>([^<]+)/ '`
  # It would have taken twice as long to build it properly
  # It probably won't happen again
  # Did you check for a virus on your system?
end

# docker
#

def add_docker_user(username)
  run = `sudo usermod -aG docker #{username}`
  puts run # and echo to log
end

def docker_stats
  puts 'wut?'
end

# services ---------------------------------------------------
#------------------------------------------------------------

def start_solargraph
  start = `screen -d -m solargraph socket --port 7658`
  puts 'Solargraph started'
end

# apps
#

def retro
  run = `cd ~/roots/cool-retro-term/ && screen -d -m ./cool-retro-term`
  puts 'started crt'
end

# web?
#

def ip
  puts HTTParty.get('https://api.ipify.org')
end

def ntptime
  require 'net/ntp'
  Net::NTP.get('pool.ntp.org')
  puts Net::NTP.get.time
end

# backup
#

def bupp
  makefile = `GZIP=-9 tar cvzf Projects.tar.gz ~/Projects`
end

def bupdocs
  makefile = `GZIP=-9 tar cvzf Documents.tar.gz ~/Documents`
end

def bupuser
  makefile = `GZIP=-9 tar cvzf user.tar.gz ~/.ssh ~/Desktop ~/Documents ~/Projects ~/Pictures ~/Videos ~/Music ~/beam ~/.icons ~/.themes ~/.bash_profile && mv user.tar.gz /home/captain/sync/bup/`
end

def buproots
  makefile = `GZIP=-9 tar cvzf Documents.tar.gz ~/roots`
end

def remake_roots
  coprine = `wget <file.ext> -O /path/to/folder/file.ext`
end

# installers -------------------------------------------------
#------------------------------------------------------------

def install_ruby_mysql
  essentials = `ruby-mysql2 default-libmysqlclient-dev`
end

def install_basics
  basics = `apt-get install curl wget vim ranger irssi weechat guake apt-build nginx ncdu links2 filezilla zip ncdu git`
end

# XD
send(ARGV[0]) if ARGV[0] 
