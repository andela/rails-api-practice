class CreateSuyas < ActiveRecord::Migration
  def change
    create_table :suyas do |t|
      t.string :type
      t.boolean :spicy
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
