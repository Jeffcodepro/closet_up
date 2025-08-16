class AddBannerToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :banner, :string
  end
end
