class PostCommentsController < ApplicationController
  def create
    # クリックされた時のidをもとにその記事情報を格納
    post_image = PostImage.find(params[:post_image_id])
    # 今ログインしているユーザーがフォームに入れたコメントをローカル変数に格納
    comment = current_user.post_comments.new(post_comment_params)
    # 表示されている記事情報のIDとコメントテーブルの記事IDを紐づける
    comment.post_image_id= post_image.id
    # 保存しリダイレクト
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    # クリックした情報をコメントをテーブルから取得し削除
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end


  # ストロングパラメータの定義
  private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
