class Suya < ActiveRecord::Base
  belongs_to :vendor

  validates :meat, presence: true
  validates_inclusion_of :spicy, :in => [true, false]
end
