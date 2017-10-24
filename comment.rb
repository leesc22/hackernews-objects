class Comment
	attr_reader :response, :username

	def initialize(response)
		@response = response
		@username = extract_username(@response)
	end

	private

	def extract_username(doc)
		doc.search('.comhead > a:first-child').map do |element|
      element.inner_text
    end
	end
end