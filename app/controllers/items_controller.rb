class ItemsController < PublicController

  expose(:items){ Item.limit(10) }
  expose(:item)
  def index
    respond_to do |format|
      format.html
      format.json { render json: timeline }
    end
  end
  def my_json
    render :layout => false
  end
  def timeline
    debugger
    puts ''
  end
end
