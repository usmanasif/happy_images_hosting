class ImagesController < ApplicationController
  before_action :set_gallery
  before_action :set_image, only: [:edit, :update, :destroy]
  impressionist actions: [:show]

  def bulk_create
    if @gallery.update(gallery_params)
      flash[:notice] = 'Images has been saved in your gallery successfully.'
    else
      flash[:alert] = @gallery.errors.full_messages.uniq.to_sentence
    end

    redirect_to root_path
  end

  def show
    @image = Image.find_by(code: params[:id])
    impressionist(@image)

    render layout: false
  end

  def edit
  end

  def create
    @image = @gallery.images.new(image_params)

    if @image.save
      flash[:notice] = 'Image has been added in your gallery successfully.'
    else
      flash[:alert] = "You don't have permissions to perform this action."
    end

    render json: {}, status: :ok
  end

  def update
    if @image.update(image_params)
      flash[:notice] = 'Image has been updated successfully.'
    else
      flash[:alert] = "You don't have permissions to perform this action."
    end

    render json: {}, status: :ok
  end

  def destroy
    if @image.present?
      @image.destroy

      flash[:notice] = 'Image has been deleted from your gallery successfully.'
    else
      flash[:alert] = "You don't have permissions to perform this action."
    end

    redirect_to root_path
  end

  private
    def gallery_params
      params.fetch(:gallery).permit(images_attributes: [:file, :_destroy])
    end

    def image_params
      params.fetch(:image).permit(:file)
    end

    def set_gallery
      @gallery = Gallery.find_by(ip_address: request.remote_ip)
    end

    def set_image
      @image = @gallery.images.find(params[:id])
    end
end
