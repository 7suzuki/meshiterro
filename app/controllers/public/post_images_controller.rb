class Public: :PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new #コメントを投稿するためのインスタンス
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path #投稿一覧へ画面遷移
    else
      render :new
    end
  end
    
  def index
    # @post_images = PostImage.all　全データ取得
    @post_images = PostImage.page(params[:page]) #ページネーション（取得数）
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path #一覧ページへ画面遷移
  end  
  # 投稿データのストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
