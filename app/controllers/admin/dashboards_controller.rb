class Admin::DashboardsController < Admin::BaseController
  def index
    @users = User.all
    @categories = Category.all
    @authors = Author.all
    @singers = Singer.all
    @lyrics = Lyric.all
    @reports = Report.all
    @comments = Comment.all
    @songs = Song.all
  end
end
