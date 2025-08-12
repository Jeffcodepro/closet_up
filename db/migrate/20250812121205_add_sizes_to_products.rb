class AddSizesToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :size, :string, array: true, default: [], null: false
  end
end
