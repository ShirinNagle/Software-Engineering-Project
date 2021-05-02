class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  def index
    
    @albums = Album.all
    @all_ratings = Album.all_ratings  
    params[:ratings] #need to pull info from the params hash
    params[:sort]#use the info to query the model
    #session[] #how to access cookies 
  end

  # GET /albums/1
  def show
      id = params[:id] #retrieve album Id from URI route
      @album = Album.find(id) # look up album by unique id
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to @album, notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      redirect_to @album, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:artist, :title, :review, :rating, :release_date)
    end
end
