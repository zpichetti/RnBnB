class AddProfileToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :profile, foreign_key: true
  end
end
