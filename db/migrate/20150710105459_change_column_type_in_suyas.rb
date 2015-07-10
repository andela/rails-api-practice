class ChangeColumnTypeInSuyas < ActiveRecord::Migration
  def change
    rename_column :suyas, :type, :meat
  end
end
