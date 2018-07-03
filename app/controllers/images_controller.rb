class ImagesController < ApplicationController
  before_action :set_gallery

  def bulk_create
    if @gallery.update(gallery_params)
      flash[:notice] = 'Images have been saved in your gallery successfully.'
    else
      flash[:alert] = @gallery.errors.full_messages.uniq.to_sentence
    end

    redirect_to root_path
  end

  def destroy
  end

  private
    def gallery_params
      params.fetch(:gallery).permit(images_attributes: [:id, :file, :_destroy])
    end

    def image_params
      params.fetch(:image).permit(:file)
    end

    def set_gallery
      @gallery = Gallery.find_by(ip_address: request.remote_ip)
    end
end
