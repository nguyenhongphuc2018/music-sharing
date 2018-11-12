class SongsController < ApplicationController
  before_action :logged_in_user, except: :index
  before_action :load_category, only: %i(new edit update)

  before_action :load_song, only: :show
  def index
    @songs = Song.get_song
    render json:@songs
  end

  def new
    @song = Song.new
    @author = @song.authors.build
    @singer = @song.singers.build
  end

  def create
    @song = Song.new song_params
    @song.authors.map{|a| a.user = current_user}
    @song.singers.map{|a| a.user = current_user}
    @song.user = current_user
    if @song.save
      flash[:success] = t ".add_song_successfully"
    else
      flash[:danger] = t ".add_song_fail"
    end
    redirect_to root_url
  end

  def show; end

  private

  def song_params
    params.require(:song).permit :name, :song_url, :category_id,
      authors_attributes: [:id, :name, :_destroy],
      singers_attributes: [:id, :name, :_destroy]
  end

  def load_category
    @category_name = Category.by_name_cate
  end

  def load_song
    @song = Song.find_by id: params[:id]
  end
end
