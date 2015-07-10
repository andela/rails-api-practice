require 'test_helper'

class SuyaTest < ActiveSupport::TestCase
  test "suya is valid with a meat and spicy" do
    suya = Suya.new(meat: "beef", spicy: true)

    assert suya.valid?

    suya.save

    assert_equal 1, Suya.count
  end

  test "suya is not valid without a meat" do
    suya = Suya.new(meat: nil, spicy: true)

    assert suya.invalid?
    refute suya.valid?
  end

  test "suya is not valid without a spiciness level" do
    suya = Suya.new(meat: "beef", spicy: nil)

    assert suya.invalid?
  end

  test "suya belongs to a vendor" do
    vendor = Vendor.create(name: "jeff")
    suya = Suya.create(meat: "beef", spicy: true)

    suya.vendor = vendor

    refute suya.vendor.blank?
    assert_equal "jeff", suya.vendor.name
  end
end
