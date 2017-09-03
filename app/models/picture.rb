class Picture < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true

  has_attached_file :image,
    :styles => { medium: "600x600#", original: {convert_options: '-auto-orient'} }

  do_not_validate_attachment_file_type :image
end
