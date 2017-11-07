class Plane < ApplicationRecord
  belongs_to :city
  has_many :passengers
  has_many :tickets
end
