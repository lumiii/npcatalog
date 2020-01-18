class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy, :play, :increment_likes]

  # GET /favourites
  # GET /favourites.json
  def index
    @favourites = sort(Favourite.all)
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show
  end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit
  end

  # POST /favourites
  # POST /favourites.json
  def create
    input = params[:links]
    links = input.split("\r\n")

    links.each do |link|
      video_datas = []


      video_data = Fetcher::All::load(link)
      raise "Nil Video Link #{link}" if video_data.nil?
      video_datas.push(video_data)


      video_datas.each do |video_data|
        Favourite.create_from_video_data(video_data)
      end
    end

    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourites have been added.'  }
    end
  end

  # PATCH/PUT /favourites/1
  # PATCH/PUT /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
    end
  end

  def play
    system('D:/vlc/vlc.exe file:///D:/b.mp4')

    respond_to do |format|
      format.html { redirect_to favourites_url }
    end
  end

  def random
    @favourites = Favourite.all.shuffle
  end

  def list
    @favourites = Favourite.all
    render :partial => "list"
  end

  def reload_table
    respond_to do |format|
      format.js
    end
  end

  def increment_likes
    @favourite.increment_likes
    @favourite.reload

    respond_to do |format|
      format.js
    end
  end

  private
    def sort(favourites)
      favourites.order(likes: :desc, updated_at: :desc)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_params
      params.require(:favourite).permit(:uri, :title)
    end
end
