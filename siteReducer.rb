require 'open-uri'
require 'nokogiri'

#ARGV[0] contains the url of the site to reduce to a tree of nodes
@doc = Nokogiri::HTML(open(ARGV[0]))

def printTree(nodes, spacer_char, opts)
	nodes.children().each do |child|
		base_output = "#{spacer_char} |-#{child.name()}"
		opts_output = ''

		opts.each do |attr|
			opts_output += ' ' + attr + ': '+ child[attr] + ' ' if child[attr]
		end

		opts_output = " (#{opts_output.strip})" if opts_output != ''
		puts base_output + opts_output
		
		printTree(child, spacer_char + "  ", opts)
	end
end

#ARGV[1..-1] is everything but the first argument (i.e. a list of 
#the optional tag attributes)
printTree(@doc.xpath('/*'), '', ARGV[1..-1])