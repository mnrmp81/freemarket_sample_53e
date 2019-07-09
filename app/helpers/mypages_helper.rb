module MypagesHelper
  def get_image_url(id)
    image = Image.find_by(post_id: id)
  end
end