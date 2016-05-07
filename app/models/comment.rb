class Comment < ActiveRecord::Base
	validates :author, presence: true
	validates :body, presence: true

	belongs_to :advertisement
	validates :advertisement, presence: true

	has_ancestry

	def self.upvote(id)
		comment = find(id)
		comment.update_attributes(rank: comment.rank.to_i + 1)
	end
end