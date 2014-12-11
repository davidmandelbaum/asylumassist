class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.belongs_to :question, index: true
      t.belongs_to :entry, index: true

      t.timestamps
    end
  end
end
