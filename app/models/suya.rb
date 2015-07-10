class Suya < ActiveRecord::Base
  belongs_to :vendor

  validates :meat, presence: true

  validates :spicy, :inclusion => { :in => [true, false] }
end
