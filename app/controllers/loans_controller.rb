class LoansController < ApplicationController
  respond_to :html
  respond_to :js, only: [:new, :create]
  before_action :find_inquiry

  def new
    @loan = Loan.new(loan_params)
  end

  def create
    @loan = current_user.given_loans.build(loan_params)
    @loan.inquiry = @inquiry

    if @loan.save
      flash[:notice] = "Thanks for giving a loan to #{@inquiry.user.public_name}! <3"
      redirect_to root_path
    else
      render :edit
    end
  end

  def update

  end

  def edit
    @loan ||= Inquiry.find(params[:id])
    if @loan.giver_id != current_user.id
      flash[:error] = "Sorry mate!"
      redirect_to root_path
    end

    render :edit
  end


  private

  def find_inquiry
    @inquiry = Inquiry.find(params[:inquiry_id])
  end

  def loan_params
    params[:loan].permit!
  end

end
