class Room < ApplicationRecord
  has_many :pictures, :dependent => :destroy
end
