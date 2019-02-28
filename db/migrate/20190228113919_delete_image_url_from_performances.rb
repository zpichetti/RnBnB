class DeleteImageUrlFromPerformances < ActiveRecord::Migration[5.2]
  def change
    remove_column :performances, :image_url
  end
end
