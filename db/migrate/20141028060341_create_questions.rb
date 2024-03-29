class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :field_type
      t.string :form_id
      t.string :checkbox_value
      t.text :explanation
      t.belongs_to :page, index: true
      t.integer :seq_no
      t.text :validations
      t.boolean :translate

      t.timestamps
    end
  end
end
