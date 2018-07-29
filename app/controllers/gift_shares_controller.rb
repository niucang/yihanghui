class GiftSharesController < ApplicationController
  before_action :set_gift_share
  def show
  end

  def open

  end

  def get_coupons
    current_user.add_coupons_by_gift(@share_gift)
  end

  private
    def set_gift_share
      @share_gift ||= Gift.where(id: params[:id]).where.not(shared_at: nil).first
      raise ActiveRecord::RecordNotFound if @share_gift.blank?
    end
end
