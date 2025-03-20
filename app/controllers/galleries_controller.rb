class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to @gallery, notice: "Gallery was successfully created."
    else
      render :new
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path, notice: "Gallery was successfully deleted."
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description, attachments: [])
  end
end
