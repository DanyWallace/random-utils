require 'mechanize'

def numConsonantGen(maxlength)
	holdabc = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
	string = (0..maxlength).map { holdabc[rand(holdabc.length)] }.join
	return string
end

def numGen(maxlength)
	holdabc = [(0..9)].map(&:to_a).flatten
	string = (0..maxlength).map { holdabc[rand(holdabc.length)] }.join
	return string
end

def fetchFromRandom(maxlength)
	fetcher = Mechanize.new
	fetch = fetcher.get("https://www.random.org/strings/?num=1&len=#{maxlength}&digits=on&upperalpha=on&loweralpha=on&format=html&rnd=new")
	return fetch.parser.xpath('/html/body/div/pre').text
end

#puts fetchFromRandom(10)
#puts numConsonantGen(9)
#puts numGen(9)