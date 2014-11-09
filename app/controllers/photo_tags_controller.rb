class PhotoTagsController < PublicController
  before_action :set_item, :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  expose(:item){ Item.all.shuffle.last }


  def create
    item = Item.find(params[:item])

    params[:taggles].each do |p|
      tag = Tag.find_or_initialize_by(name: p)
      tag.save
      ut = UserTag.find_or_initialize_by(user_id: current_user.id, tag_id: tag.id, item_id: item.id )
      ut.save
    end
    if params[:from_page] == 'items'
      redirect_to item_path(item)
    else
      redirect_to photo_tags_path
    end
  end

  private
    def set_tag
      @tag = Tag.find_by_or_intialize(params[:tag])
    end

    def set_item
      @item = Item.find(params[:item])
    end

    def set_user_tag
      @user_tag = UserTag.find_by_or_intialize(@tag)
    end

  def photo_tags_params

      params.require(:photo_tags).permit(:tag,:title, :start, :finish, :location, :ticketurl, :description)

  end

end
