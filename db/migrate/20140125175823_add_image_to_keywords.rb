class AddImageToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :image, :string
  end
end
