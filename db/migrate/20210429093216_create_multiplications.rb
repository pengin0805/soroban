class CreateMultiplications < ActiveRecord::Migration[6.0]
  def change
    create_table :multiplications do |t|
      t.string   :formula,     null: false
      t.integer  :answer,      null: false
      t.timestamps
    end
  end
end
