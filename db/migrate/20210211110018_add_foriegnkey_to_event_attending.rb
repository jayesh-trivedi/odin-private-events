class AddForiegnkeyToEventAttending < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_attendings, :event_attendee, references: :users, index: true
    add_reference :event_attendings, :attended_event, references: :events, index: true

    add_foreign_key :event_attendings, :users, column: :event_attendee_id
    add_foreign_key :event_attendings, :events, column: :attended_event_id
  end
end
