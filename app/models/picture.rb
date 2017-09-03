class Picture < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true

  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename",
    :styles => { medium: "600x600#" }

  do_not_validate_attachment_file_type :image
end
