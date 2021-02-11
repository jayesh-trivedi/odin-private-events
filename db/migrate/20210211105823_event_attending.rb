class EventAttending < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendings do |t|

      t.timestamps
  end
end
end
