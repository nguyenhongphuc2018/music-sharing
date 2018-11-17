class LyricsController < ApplicationController
  before_action :load_song

  def create
    @lyric = @song.lyrics.new lyric_params
    @lyric.user = current_user
    if @lyric.save
      flash[:success] = t ".create_successfully"
      redirect_to song_path @song
    else
      render "new"
    end
  end

  private

  def load_song
    @song = Song.find_by id: params[:song_id]
    return if @song
    flash[:danger] = t ".no_song"
    redirect_to song_path @song
  end

  def lyric_params
    params.require(:lyric).permit :content
  end
end
