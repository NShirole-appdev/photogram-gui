class PhotosController < ApplicationController
  def index
    
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    #parameter is path_id = 888
    
    @url_id = params.fetch("path_id").to_i
    matching_photos = Photo.where({ :id => @url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete

    @the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => @the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

   # render ({ :template => "photo_templates/delete.html.erb"})

   redirect_to("/photos")

  end

  def create

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save


    redirect_to("/photos/" + a_new_photo.id.to_s)

   # render ({ :template => "photo_templates/create.html.erb"})

  end


  def update
  
    the_id = params.fetch("modify_id")

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save
    redirect_to("/photos/" + the_id)

  end

  def comment
   # Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_body
    
    a_new_comment.save
    redirect_to("/photos/" + input_photo_id.to_s)

  end
end