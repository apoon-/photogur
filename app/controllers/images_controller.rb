class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = @images.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.title = params[:image][:title]
    @image.author = params[:image][:author]
    @image.url = params[:image][:url]

    redirect_to images_url
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:title, :author, :url)
  end

end
