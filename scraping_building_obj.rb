# Start coding your hackernews scraper here!
require 'nokogiri'
require 'open-uri'

require_relative 'post'
require_relative 'comment'

post = Post.new(ARGV[0])
puts "Post title: #{post.title.first}"
puts "Post points: #{post.points.first}"
puts "Post ID: #{post.item_id.first}"
puts "Number of comments: #{post.comments.size}"
# post.comments.each do |comment|
# 	puts comment.username
# 	puts comment.response
# end