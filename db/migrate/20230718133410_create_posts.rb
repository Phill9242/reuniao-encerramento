class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :dev
      t.text :description
      t.date :date
      t.string :status
      t.string :good_bad

      t.timestamps
    end
  end
end