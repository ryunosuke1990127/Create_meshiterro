class FavoritesController < ApplicationController

  def create
    # クリックされた時の記事の情報(=ID)を取得しその上をローカル変数にセットする
    post_image = PostImage.find(params[:post_image_id])
    # いいねを押した時のその記事IDを取得しインスタンスを生成
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    # 上記の上をを保存
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    # クリックされたユーザーの情報を取得しローカル変数に保存
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
