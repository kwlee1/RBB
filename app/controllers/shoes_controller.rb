class ShoesController < ApplicationController
    def index
        @shoes=Newshoe.all 
    end
    def create
        @shoe=Newshoe.new(shoe_helper)
        if @shoe.save 
            redirect_to shoes_path
        else 
            flash[:errors]=@shoe.errors.full_messages
            redirect_to :back
        end 
    end 
    def buy 
        shoe = Newshoe.find(params[:id])
        @purchase=Purchase.new(user:current_user,newshoe:shoe)
        @purchase.save 
        redirect_to user_path
    end 
    def remove 
        shoe = Newshoe.find(params[:id])
        shoe.delete 
        redirect_to shoes_path
    end 



    private
    def shoe_helper
        params.require(:shoe).permit(:name,:amount).merge(user:current_user) if params[:shoe].present?
    end
end
