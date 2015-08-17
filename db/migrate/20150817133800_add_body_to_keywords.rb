class AddBodyToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :body, :text
  end
end
