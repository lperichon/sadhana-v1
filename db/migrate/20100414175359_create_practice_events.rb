class CreatePracticeEvents < ActiveRecord::Migration
  def self.up
    create_table :practice_events do |t|
      t.references :user
      t.references :practice
      t.datetime :start

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_events
  end
end
