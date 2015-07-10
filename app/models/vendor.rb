class Vendor < ActiveRecord::Base
  has_many :suyas

  validates :name, presence: true, length: { in: 2..20 }
end
