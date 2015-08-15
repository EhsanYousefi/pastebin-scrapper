class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :pattern
      t.string :word
      t.string :url
      t.integer :occur

      t.timestamps null: false
    end
  end
end
