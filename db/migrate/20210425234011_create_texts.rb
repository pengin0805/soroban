class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.string      :text_name,      null: false
      t.text        :text_info,      null: false
      t.string      :text_class
      t.timestamps
    end
  end
end
