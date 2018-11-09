module Recommendation
  def recommend_songs
    other_users = self.class.all.where.not(id: self.id)
    recommended = Array.new()
    other_users.each do |user|
      common_songs = user.likes & self.likes
      (user.likes - common_songs).each do |song|
        recommended << song.song_id
      end
    end
    recommended
  end
end