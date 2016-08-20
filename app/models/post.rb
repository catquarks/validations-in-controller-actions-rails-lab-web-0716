class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 100}
	validate :correct_category


	private
		def correct_category
			valid_categories = ["fiction", "non-fiction"]
			if category 
				unless valid_categories.include?(category.downcase)
					errors.add(:category, "must be a valid category! e.g. #{valid_categories.join(", ")}")
				end
			else
				errors.add(:category, "must exist! e.g. #{categories.join(", ")}")
			end
		end
end
