class UsersController < ApplicationController
  #Cada metodo de aqui es para la vista con el mismo
  #nombre de esa
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)  
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
