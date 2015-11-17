class AddImgBigFileNameToRecords < ActiveRecord::Migration
  def change
    add_column :records, :img_big_file_name, :string
  end
end
