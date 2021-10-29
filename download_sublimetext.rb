puts 'Finding latet sublimetext tar.xz'
subl_site_html = `wget -qO- https://www.sublimetext.com/download`
subl_link, subl_file = ''
subl_site_html.each_line do |line|
  if line.include? 'tarball'
    subl_link = line.match(/https\S*x64.tar.xz/).to_s
    subl_file = subl_link.match /sublime_text\S*/
  end
end

dl = "wget #{subl_link}"
extract = "tar xvf #{ subl_file }"
install = "mv sublime_text #{ENV['HOME']}/cannon/bin/." 
move = "mv #{subl_file} /tmp/."
puts `#{dl}`
puts `#{extract}`
puts `#{install}`
puts `#{move}`