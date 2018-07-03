class GalleriesController < ApplicationController
  def show
    @gallery = Gallery.find_or_create_by(ip_address: request.remote_ip)
  end
end
