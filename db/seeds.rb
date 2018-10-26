require 'faker'

ips = 50.times.map do
  Faker::Internet.ip_v4_address
end

user_logins = 100.times.map do
  Faker::Internet.username
end

puts "\n\tCreating 200k Posts #{DateTime.now}"

200_000.times do
  attributes = {
    title: Faker::Lorem.sentence(3),
    body: Faker::Lorem.paragraph(3),
    author_ip: ips.sample,
    login: user_logins.sample
  }
  ::CreatePost.new(attributes).call
end

puts "\n\t200k Posts created #{DateTime.now}"

puts "\n\tCreating posts ratings #{DateTime.now}"

posts = Post.all

posts.each do |post|
  10.times do
    attributes = {
      post_id: post.id,
      value: rand(1..5)
    }
    ::CreateRating.new(attributes).call
  end
end

puts "\n\tPosts ratings created #{DateTime.now}"

#################################################
# Speed up seeds

# User.import([:login], user_logins.map{ |login| Array(login) })
#
# puts "\n\tCreating 200k Posts #{DateTime.now}"
#
# users = User.all
#
# ratings_attributes = []
#
# posts_attributes = (1..200_000).map do |number|
#   user = users.sample
#   count = rand(1..5)
#   sum = 0
#
#   count.times do
#     value = rand(1..5)
#     ratings_attributes << {
#       post_id: number,
#       value: rand(1..5)
#     }
#     sum += value
#   end
#
#   {
#     title: Faker::Lorem.sentence(3),
#     body: Faker::Lorem.paragraph(3),
#     author_ip: ips.sample,
#     login: user.login,
#     user_id: user.id,
#     rating_sum: sum,
#     rating_count: count,
#     rating_avg: sum.to_d / count,
#     lock_version: count
#   }
# end
#
# Post.import(posts_attributes)
#
# puts "\n\t200k Posts created #{DateTime.now}"
#
# puts "\n\tCreating posts ratings #{DateTime.now}"
#
# Rating.import(ratings_attributes)
#
# puts "\n\tPosts ratings created #{DateTime.now}"
