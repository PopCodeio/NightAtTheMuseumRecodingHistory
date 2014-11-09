class PhotoTagsController < PublicController
  expose(:item){ Item.last }
end
