class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :seq_no
      t.string :name
      t.text :guidance
      t.belongs_to :section, index: true

      t.timestamps
    end
  end
end
