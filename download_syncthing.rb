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
extract = "tar xvf #{ syncthing_file } && mv syncthing*gz /tmp/. && mv syncthing* syncthing"
install = "mv syncthing #{ENV['HOME']}/cannon/bin/." 

puts `#{dl}`
puts `#{extract}`
puts `#{install}`