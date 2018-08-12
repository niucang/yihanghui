require 'rails_admin/main_controller'
class RailsAdmin::ShowCouponsController < RailsAdmin::ApplicationController
  layout false
  def show
    @coupon_types = CouponType.all
  end
end
