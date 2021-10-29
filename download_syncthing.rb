puts 'Finding latet syncthing tar.xz'
syncthing_link = 'https://github.com/syncthing/syncthing/releases'
syncthing_site_html = `wget -qO- #{syncthing_link}`
syncthing_link, syncthing_file = ''
syncthing_site_html.each_line do |line|
  if line.match? /syncthing-linux-amd64-\S*z/
    syncthing_file = line.match(/syncthing-linux-amd64-\S*z/)
    syncthing_link = 'https://github.com/' + line.match(/syncthing\S*syncthing-linux-amd64-\S*z/).to_s
    break
  end
end

dl = "wget #{syncthing_link}"
extract = "mkdir syncthing && tar xvf #{ syncthing_file } --directory syncthing/."
install = "mv syncthing #{ENV['HOME']}/cannon/bin/." 
move = "mv #{syncthing_file} /tmp/."

puts `#{dl}`
puts `#{extract}`
puts `#{install}`
puts `#{move}`