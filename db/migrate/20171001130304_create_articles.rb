class Articles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      #create table 'title'
      t.string :title
    end
  end
end
