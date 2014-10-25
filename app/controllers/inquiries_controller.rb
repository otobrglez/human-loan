class InquiriesController < ApplicationController
  respond_to :html
  respond_to :js, only: [:index]
  before_filter :authorize, only: [:new, :create, :update]

  def index
    @inquiries = Inquiry.active.page(params[:page]||1)
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.user_id != current_user.id
      flash[:error] = "Sorry mate!"
      redirect_to root_path
    end

    render :edit
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @inquiry ||= current_user.inquiries.build
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.user_id != current_user.id
      flash[:error] = "Sorry mate!"
      redirect_to root_path
    end

    if @inquiry.update(inquiry_params)
      flash[:notice] = 'Your inquiry was updated.'
      redirect_to root_path
    else
      redirect_to :edit
    end
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
