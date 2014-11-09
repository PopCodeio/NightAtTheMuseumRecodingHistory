class CommentsController < PublicController



  def create
    comment = Comment.create
    comment.user_id = current_user.id
    comment.item_id = params[:item]
    comment.comment = params[:comment]
    if comment.save
      flash[:notice] = t(:comment_created)

      if current_user.comments.count > 1
        add_badge = true
        current_user.badges.each do |b|
          if b.id == 6
            add_badge = false
          end
        end
        if add_badge
          current_user.add_badge(6)
        end
      end
      if current_user.comments.count > 5
        add_badge = true
        current_user.badges.each do |b|
          if b.id == 7
            add_badge = false
          end
        end
        if add_badge
          current_user.add_badge(7)
        end
      end
      if current_user.comments.count > 10
        add_badge = true
        current_user.badges.each do |b|
          if b.id == 8
            add_badge = false
          end
        end
        if add_badge
          current_user.add_badge(8)
        end
      end
      redirect_to item_path(params[:item])
    else
      render :new
    end
  end


end
