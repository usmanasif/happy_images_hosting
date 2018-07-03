class GalleriesController < ApplicationController
  def show
    @gallery = Gallery.find_or_create_by(ip_address: request.remote_ip)
    @gallery.images.build
  end

  private
    def gallery_params
      params.fetch(:gallery).permit(images_attributes: [:id, :file, :_destroy])
    end
end
