class RenameProjectsToGalleries < ActiveRecord::Migration[8.0]
  def change
    rename_table :projects, :galleries
  end
end
