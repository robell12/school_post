class School < ApplicationRecord
  validates_presence_of :name
  has_many :periods
end
