class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.title = params[:image][:title]
    @image.author = params[:image][:author]
    @image.url = params[:image][:url]

    @image.save

    redirect_to images_url
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(picture_params)
      redirect_to "/images/#{@image.id}"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:title, :author, :url)
  end

end
