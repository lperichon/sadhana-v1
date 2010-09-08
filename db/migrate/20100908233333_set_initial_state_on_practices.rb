class SetInitialStateOnPractices < ActiveRecord::Migration
  def self.up
    execute "UPDATE practices SET state='created';"
  end

  def self.down
  end
end
