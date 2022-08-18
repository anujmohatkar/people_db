class Address < ApplicationRecord
  belongs_to :person
  has_one_attached :audio
end
