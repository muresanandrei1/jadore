class Restaurant < ApplicationRecord
  has_many :pictures, as: :attachable, :dependent => :destroy
end
