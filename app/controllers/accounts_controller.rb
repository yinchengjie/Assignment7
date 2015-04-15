class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: "Account was successfully updated!"
    else
      render :edit
    end
  end

  private
  def set_account
    @account = current_user.account
  end

  def account_params
    params.require(:account).permit(:first_name, :last_name, :gender, :age)
  end


end
