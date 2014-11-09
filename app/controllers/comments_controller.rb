class CommentsController < PublicController



  def create
    comment = Comment.create
    comment.user_id = current_user.id
    comment.item_id = params[:item]
    comment.comment = params[:comment]
    if comment.save
      flash[:notice] = t(:comment_created)
      redirect_to item_path(params[:item])
    else
      render :new
    end
  end


end
