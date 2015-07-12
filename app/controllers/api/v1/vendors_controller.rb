class Api::V1::VendorsController < ApplicationController
  def index
    render json: Vendor.all
  end
end
