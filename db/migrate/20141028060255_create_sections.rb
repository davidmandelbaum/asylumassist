class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :seq_no
      t.text :guidance

      t.timestamps
    end
  end
end
