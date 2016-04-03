class AddPictureToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :picture, :string
  end
end
