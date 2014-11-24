class CreateFormTexts < ActiveRecord::Migration
  def change
    create_table :form_texts do |t|
      t.text :guidance
      t.integer :seq_no
      t.belongs_to :page, index: true

      t.timestamps
    end
  end
end