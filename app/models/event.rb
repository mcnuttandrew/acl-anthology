class Event < ActiveRecord::Base
	belongs_to :venue

	has_and_belongs_to_many :volumes
  	#validates_associated :volumes
  	accepts_nested_attributes_for :volumes

  	extend FriendlyId
	friendly_id :venue_event, use: [:slugged, :history]

	def venue_event
		"#{Venue.find(:venue_id).acronym} #{year}"
	end

	def should_generate_new_friendly_id?
		year_changed? || venue_id_changed?
	end
end