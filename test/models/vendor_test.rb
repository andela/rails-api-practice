require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test "A vendor is valid with a name" do
    vendor = Vendor.create(name: "Jeff")
    assert vendor.valid?
    refute vendor.invalid?
  end

  test "a vendor is not valid without a name" do
    vendor = Vendor.create(name: "Jeff")
    vendor.name = nil

    refute vendor.errors.empty?
    assert vendor.invalid?
    refute vendor.valid?
  end

  test "a vendor is not valid without name, using new method" do
    vendor = Vendor.new(name: nil)

    assert vendor.invalid?
    refute vendor.valid?
  end

  test "a vendor can have a name that is between 2 and 20 characters long" do
    vendor1 = Vendor.create(name: "a")
    vendor2 = Vendor.create(name: "four")
    vendor3 = Vendor.create(name: "ThisNameIsThirtyLength30303030")

    assert vendor1.invalid?
    assert vendor3.invalid?
    assert vendor2.valid?
  end

  test "vendors have to have unique names" do
    vendor1 = Vendor.create(name: "jeff")
    vendor2 = Vendor.new(name: "jeff")

    vendor1.valid?
    vendor2.invalid?
  end

  test "a vendor can have many suyas" do
    vendor = Vendor.create(name: "Jeff")
    beef_suya = Suya.create(meat: "beef", spicy: true)
    kidney_suya = Suya.create(meat: "kidney", spicy: false)

    vendor.suyas << beef_suya
    vendor.suyas << kidney_suya

    assert_equal 2, vendor.suyas.count
  end

  test "a vendor can have many suyas, another way with arrays" do
    vendor = Vendor.create(name: "Jeff")
    beef_suya = Suya.create(meat: "beef", spicy: true)
    kidney_suya = Suya.create(meat: "kidney", spicy: false)

    vendor.suyas = [beef_suya, kidney_suya]

    assert_equal 2, vendor.suyas.count
  end
end
