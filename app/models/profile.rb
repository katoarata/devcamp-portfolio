class Profile < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle:'Angular')
	end

	scope :ruby_on_rails_profile_items, ->{where(subtitle: "Ruby on Rails")}

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||=	"https://via.placeholder.com/150"
		self.thumb_image ||= "https://via.placeholder.com/150"
	end
end

