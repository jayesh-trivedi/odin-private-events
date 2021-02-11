class Event < ApplicationRecord
 belongs_to :creator, foreign_key: :creator_id, class_name: "User"
 has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }
end
