class AddSectionTranslation < ActiveRecord::Migration
  def up
    Section.create_translation_table!({
      name: :string, 
      guidance: :text
    }, {
      migrate_data: true
    })
  end
  def down
    Section.drop_translation_table! migrate_data: true
  end
end
