class Post
	attr_accessor :title, :url, :points, :item_id

	def initialize(url)
		@url = url
		@response = Nokogiri::HTML(open(url))
		@title = extract_title(@response)
		@points = extract_points(@response)
		@item_id = extract_item_id(@response)
	end

	# Returns all comments associated with a particular post
	def comments
		extract_comments(@response)
	end

	# Takes a Comment object as its input and adds it to the comment list
	def add_comment
	end

	private

	def extract_title(doc)
		doc.search('.title > a:first-child').map do |link|
			link.inner_text
		end
	end

	def extract_points(doc)
		doc.search('.subtext > span:first-child').map do |span|
			span.inner_text
		end
	end

	def extract_item_id(doc)
		doc.search('.fatitem > tr:first-child').map do |row|
			row["id"]
		end
	end

	def extract_comments(doc)
		doc.search('.default').map do |div|
			Comment.new(response = div)
    end
	end
end