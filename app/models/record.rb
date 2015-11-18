#for retrieving the image from the remote url
require 'open-uri' 

class Record < ActiveRecord::Base
	#validates :NOM, presence: true
  
after_create :change_name

  #specify that the img_small is a paperclip file attachment
  has_attached_file :img_small, :path => ":rails_root/public/system/images/:id.jpg", :url => "/system/images/:id.jpg"
  has_attached_file :img_big, :path => ":rails_root/public/system/images/:id_max.jpg", :url => "/system/images/:id_max.jpg"
  do_not_validate_attachment_file_type :img_small
  do_not_validate_attachment_file_type :img_big

  #pull the image from the remote url and assign it as the img_small
  def img_small_from_url(url)
    self.img_small = open(url)
  end

  def img_big_from_url(url)
    self.img_big = open(url)
  end

  def change_name
    self.update_attribute(:img_small_file_name, "#{self.id}.jpg")
    self.update_attribute(:img_big_file_name, "#{self.id}_max.jpg")
  end
end
