class AddDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
    # Add to Articles table a description column with format text
    add_column :articles, :description, :text

    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
