class AddOneSecADayToPractices < ActiveRecord::Migration
  def self.up
  	add_column :practices, :one_sec_a_day, :boolean, :default => false
  end

  def self.down
  	remove_column :practices, :one_sec_a_day
  end
end
