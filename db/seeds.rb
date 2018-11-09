10.times do |n|
  name = FFaker::Name.name
  email = FFaker::Internet.email
  User.create! name: name,
  email: email
end

10.times do |n|
  name = FFaker::Music.genre
  info = FFaker::Lorem.paragraph
  user_id = rand 1..10
  Category.create! name: name,
    info: info,
    user_id: user_id
end
