class AddQuestionTranslation < ActiveRecord::Migration
  def up
    Question.create_translation_table!({
      name: :string, 
      explanation: :string
    }, {
      migrate_data: true
    })
  end
  def down
    Question.drop_translation_table! migrate_data: true
  end
end
