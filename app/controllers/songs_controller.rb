class SongsController < ApplicationController
  before_action :logged_in_user, except: %i(index show)
  before_action :load_song, only: %i(destroy edit update)
  before_action :load_category, only: %i(new edit update)

  def index
    @songs = Song.get_song
    render json:@songs
  end

  def show; end

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
      redirect_to users_my_song_url
    else
      flash[:danger] = t ".add_song_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @song.update_attributes song_params
      flash[:success] = t ".song_updated"
      redirect_to users_my_song_url
    else
      flash[:danger] = t ".song_update_failed"
      render :edit
    end
  end

  def destroy
    if @song.destroy
      flash[:success] = t ".delete_successfully"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to users_my_song_url
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
    return if @song
    flash[:danger] = t ".no_found_song"
    redirect_to root_url
  end

  def song_params
    params.require(:song).permit :name, :song_url, :category_id,
      authors_attributes: [:id, :name, :_destroy],
      singers_attributes: [:id, :name, :_destroy]
  end

  def load_category
    @category_name = Category.by_name_cate
  end
end
