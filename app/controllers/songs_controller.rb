class SongsController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    impressionist(@song)
    @song = Song.friendly.find(params[:id])
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    @song = Song.friendly.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
   @song = current_profile.songs.build(song_params)
   #@song = Song.friendly.find(params[:id])


    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    @song = Song.friendly.find(params[:id])
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :description, :songcover, :sound, :lyricsbody1, :lyricschorus1, :lyricsbody2, :lyricschorus2, :lyricsbody3, :lyricschorus3, :youtubeurl)
    end
end
