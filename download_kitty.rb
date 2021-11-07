# setup, gui
puts 'Finding latet kitty tar.xz'
kitty_link = 'https://github.com/kovidgoyal/kitty/releases'
kitty_site_html = `wget -qO- #{kitty_link}`
kitty_link, kitty_file = ''
kitty_site_html.each_line do |line|
  if line.match? /kitty-\d\S*x86_64.txz/
    kitty_file = line.match(/kitty-\d\S*x86_64.txz/)
    kitty_link = 'https://github.com/' + line.match(/kovidgoyal\S*x86_64.txz/).to_s
    break
  end
end

puts "wget #{kitty_link}"
puts "mkdir kitty && tar xvf #{ kitty_file } --directory kitty/"
puts "mv kitty #{ENV['HOME']}/cannon/bin/." 
puts "mv #{kitty_file} /tmp/."