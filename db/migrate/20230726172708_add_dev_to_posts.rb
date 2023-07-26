class AddDevToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :dev, null: false, foreign_key: true
  end
end
