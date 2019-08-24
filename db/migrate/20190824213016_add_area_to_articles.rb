class AddAreaToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :area, :string, limit: 2
  end
end
