class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user, index: true
      t.text :note
      t.datetime :completed_at
      t.boolean :needs_translation
      t.datetime :translated_at
      t.text :locale

      t.timestamps
    end
  end
end
