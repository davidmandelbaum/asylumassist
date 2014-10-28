class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :type
      t.string :form_id
      t.string :explanation
      t.belongs_to :page, index: true
      t.integer :seq_no

      t.timestamps
    end
  end
end
