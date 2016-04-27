class RemovePosterImageUrl < ActiveRecord::Migration
  def change
    change_table :materials do |t|
      t.remove :poster_image_url
    end
  end
end
