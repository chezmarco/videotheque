#for retrieving the image from the remote url
require 'open-uri' 

class Record < ActiveRecord::Base
	#validates :NOM, presence: true
  
  #specify that the img_small is a paperclip file attachment
  has_attached_file :img_small, :path => ":rails_root/app/assets/images/:id.jpg", :url => ":id.jpg"
  has_attached_file :img_big, :path => ":rails_root/app/assets/images/:id_max.jpg", :url => ":id_max.jpg"
  do_not_validate_attachment_file_type :img_small
  do_not_validate_attachment_file_type :img_big

  #pull the image from the remote url and assign it as the img_small
  def img_small_from_url(url)
    self.img_small = open(url)
  end

  def img_big_from_url(url)
    self.img_big = open(url)
  end

end
