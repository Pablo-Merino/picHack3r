class Picture < ActiveRecord::Base
  require 'digest/md5'

  has_attached_file :photo, :styles => { :thumbnail => "150x150>" },
                    :url  => "/assets/data/:class/:id_partition/:style/:basename/picture.:extension",
                    :path => ":rails_root/public/assets/data/:class/:id_partition/:style/:basename/picture.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  attr_accessible :photo
  before_post_process :image?
  def image?
    !(photo_content_type =~ /^image.*/).nil?
  end
end
