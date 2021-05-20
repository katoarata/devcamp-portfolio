class Profile < ApplicationRecord
	has_many :technologies
	# accepts_nested_attributes_for :techonologies, reject_if: lambda {|attrs| attrs['name'].blank?}
	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle:'Angular')
	end

	scope :ruby_on_rails_profile_items, ->{where(subtitle: "Ruby on Rails")}

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||=	Placeholder.image_generator(height: '600', width: '250')
		self.thumb_image ||= Placeholder.image_generator(height: '250', width: '250')
	end
end

