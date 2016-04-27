class AddPosterImageToMaterials < ActiveRecord::Migration
  def change
    change_table :materials do |t|
      t.string :poster_image
    end
  end
end
