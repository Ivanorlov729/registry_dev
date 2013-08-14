class Image < ActiveRecord::Base
  attr_accessible :picture
	belongs_to :imageable, :polymorphic=>true
  
  has_attached_file :picture,
                    :url  => "/assets/picture/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/picture/:style/:basename.:extension"

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes

end
