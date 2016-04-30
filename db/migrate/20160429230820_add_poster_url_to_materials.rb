class AddPosterUrlToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :poster_url, :string
  end
end
