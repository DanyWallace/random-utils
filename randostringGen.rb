require 'digest'
require 'mechanize'

def numConsonantGen(maxlength)
	holdabc = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
	string = (0..maxlength).map { holdabc[rand(holdabc.length)] }.join
	return string
end

def shaGen(maxlength)
	holdabc = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
	string = (0..27).map { holdabc[rand(holdabc.length)] }.join
	stringwhirled = Digest::SHA512.hexdigest(string)
	return stringwhirled[0..maxlength]
end

def numGen(maxlength)
	holdabc = [(0..9)].map(&:to_a).flatten
	string = (0..maxlength).map { holdabc[rand(holdabc.length)] }.join
	return string
end

puts numConsonantGen(9)
puts whirlGen(15)
#puts numGen(9)

def fetchFromRandom(maxlength)
	fetcher = Mechanize.new
	fetch = fetcher.get("https://www.random.org/strings/?num=1&len=#{maxlength}&digits=on&upperalpha=on&loweralpha=on&format=html&rnd=new")
	return fetch.parser.xpath('/html/body/div/pre').text
end

#puts fetchFromRandom(10)
