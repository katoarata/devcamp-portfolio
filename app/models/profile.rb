class Profile < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, reject_if: lambda {|attrs| attrs['name'].blank?}
	validates_presence_of :title, :body

	def self.angular
		where(subtitle:'Angular')
	end

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader


	scope :ruby_on_rails_profile_items, ->{where(subtitle: "Ruby on Rails")}

	# after_initialize :set_defaults


end

