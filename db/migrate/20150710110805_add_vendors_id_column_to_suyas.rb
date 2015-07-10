class AddVendorsIdColumnToSuyas < ActiveRecord::Migration
  def change
    add_column :suyas, :vendor_id, :integer
    add_index :suyas, :vendor_id
  end
end
