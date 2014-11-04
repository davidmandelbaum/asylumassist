class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user, index: true
      t.text :note
      t.datetime :completed_at

      t.timestamps
    end
  end
end
