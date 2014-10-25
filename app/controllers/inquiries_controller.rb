class InquiriesController < ApplicationController
  respond_to :html
  respond_to :js, only: [:index]
  before_filter :authorize, only: [:new, :create, :update]

  def index
    @inquiries = Inquiry.active.page(params[:page]||1)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @inquiry ||= current_user.inquiries.build
  end

  def create
    @inquiry = current_user.inquiries.build(inquiry_params)
    if ! @inquiry.save
      render :new
    else
      flash[:error] = "Your'r inquiry was successfuly created!"
      redirect_to root_path
    end
  end

  private

  def inquiry_params
    params[:inquiry].permit(:amount_cents, :amount_currency, :expires_at, :reason)
  end
end
