class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def show
      @purchase=Purchase.find(params[:id])
      # @course = Course.find(@purchase.course_id)
  end

  def index
    @purchases=Purchase.all
  end

  def destroy
    @purchase=Purchase.find_by_uuid(params[:id])
    @purchase.destroy
    redirect_to Purchases_url, notice: 'Purchase was successfully destroyed.'
  end
end
