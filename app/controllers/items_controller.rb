class ItemsController < PublicController
  def index
    respond_to do |format|
      format.html
      format.json { render json: Item.all.limit(10) }
    end
  end
end
