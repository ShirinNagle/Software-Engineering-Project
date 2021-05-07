class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  def index
    sort = params[:sort] || session[:sort]#use the info to query the model
        case sort
    when 'artist'
      ordering,@artist_header = {:artist => :asc}, 'bg-warning hilite'
    when 'release_date'
      ordering,@date_header = {:release_date => :asc}, 'bg-warning hilite'
    when 'title'
      ordering,@title_header = {:title => :asc}, 'bg-warning hilite'
    end  
   
    @all_ratings = Album.all_ratings
   
    @ratings_to_show = params[:ratings] || session[:ratings] || {}
      
      if @ratings_to_show == {}
          @ratings_to_show = Hash[@all_ratings.map {|rating| [rating, rating]}]
          #@ratings_to_show = Hash[@ratings_to_show.map {|rating| [rating, rating]}]
      end
    if params[:search]
       search_albums
    elsif params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @ratings_to_show
      redirect_to :sort => sort, :ratings => @ratings_to_show and return
    end
      
      @albums = Album.where(rating: @ratings_to_show.keys).order(ordering)
      
  end
    
    def search_albums
        #@albums = Album.find params[:id]
        if @album = Album.all.find{|album|album.title.include? (params[:search])}
            redirect_to album_path(@album)
        else
            flash[:warning] = "Title not found in Albums"
            redirect_to albums_path
        end
        
    end
    def search_db
        #simulate failure for sad path
        #flash[:warning] = "'#{params[:search]}' was not found in Albums Database"
        #redirect_to albums_path
        @albums = Album.find_in_db(params[:search])
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
      #redirect_to @album, notice: 'Album was successfully created.'#routes to the album location in db
      redirect_to albums_path, notice: 'Album was successfully created.'
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