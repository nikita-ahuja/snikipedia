class PhotosController < ApplicationController
  # before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.order('created_at')
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end
  end

  # GET /shows/new
  def new
    @photo = Photo.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to photos_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'The photo was destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

    # def set_photo
    #   @photo = Photo.find(params[:id])
    # end

    def photo_params
      # params.require(:photo).permit(:image, :title)
      params.require(:photo).permit(:image, :title, :user_id, :article_id )
    end

end
