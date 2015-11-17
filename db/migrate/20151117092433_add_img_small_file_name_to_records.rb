class AddImgSmallFileNameToRecords < ActiveRecord::Migration
  def change
    add_column :records, :img_small_file_name, :string
  end
end
