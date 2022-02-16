class Person < ApplicationRecord
  has_many :address, :dependent => :destroy
  belongs_to :user
end
