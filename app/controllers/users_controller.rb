class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @post_images = @user.post_images(全件取得)
    @post_images = @user.post_images.page(params[:page]) #ページネーション（取得数制限）
    
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
    
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id) #ユーザーの詳細ページに画面遷移
  end
  
  private
    
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end  