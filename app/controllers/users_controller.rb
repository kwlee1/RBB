class UsersController < ApplicationController
  def index
  end
  def create
    @user = User.new(reg_helper)
    if @user.save
        session[:user_id] = @user.id
        redirect_to shoes_path 
    else
        flash[:errors] = @user.errors.full_messages
        redirect_to '/'
    end
  end 
  def show
    @myshoes=Newshoe.where(user:current_user)
    @mypurchases=Purchase.where(user:current_user)
    sum = 0 
    @mypurchases.each do |purchase| 
        sum += purchase.newshoe.amount 
    end 
    @totalpurchases = sum 
    sold = 0 
    @myshoes.each do |shoe| 
        if shoe.purchase 
            sold += shoe.amount 
        end 
    end 
    @totalsales = sold 
  end 

  private
  def reg_helper
      params.require(:user).permit(:first_name,:last_name,:email,:password) if params[:user].present?
  end
end
