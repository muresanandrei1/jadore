class Room < ApplicationRecord
  has_attached_file :photo, styles: { medium: "600x600>", thumb: "300x300>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
