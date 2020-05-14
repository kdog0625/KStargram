class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text,null: false
      t.string :title,null: false
      t.string :sex,null:false
      t.integer :tall,null: false
      t.string :season,null:false
      t.text :image,null:false
      t.integer :temp,null:false
      t.string :typestyle,null:false
      t.integer :user_id
      t.timestamps
    end
  end
end
