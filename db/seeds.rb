# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

require 'faker'

# Create testing Users
admin =
1.times do
 user = User.create!(
   email: "admin@example.com",
   username: "admin",
   password: "password",
 )
end

# Create Users
100.times do
 user = User.create!(
   email: Faker::Internet.unique.email,
   username: Faker::Internet.unique.user_name,
   password: Faker::Lorem.characters(8),
 )
end

will =
1.times do
 user = User.create!(
   email: "will23larry@example.com",
   username: "will23larry",
   password: "password",
 )
end

users = User.all

# Create JobPosts
10.times do
  post = Post.create!(
    content_type: JobPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(1, 10)
  )
  JobPost.create!(
    id: post.content_id,
    title: Faker::Job.title,
    body: Faker::ChuckNorris.fact,
    link: Faker::Internet.url,
    salary: Faker::Number.between(60000, 120000),
    location: Faker::Address.city
    # tag_list: Faker::ProgrammingLanguage.name
  )
end

# Create MeetingPost
10.times do
  post = Post.create!(
    content_type: MeetingPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(11, 21)
  )
  MeetingPost.create!(
    id: post.content_id,
    title: Faker::Lorem.sentence,
    body: Faker::MostInterestingManInTheWorld.quote,
    date: Faker::Date.between(Date.today, 2.year.from_now)
    # tag_list: Faker::ProgrammingLanguage.name
  )
end

# Create PicPost
10.times do
  post = Post.create!(
    content_type: PicPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(22, 32)
  )
  PicPost.create!(
    id: post.content_id,
    image_file_name:   Faker::LoremPixel.image,
    image_content_type: "image/jpeg",
    image_file_size: Faker::Number.between(60000, 120000),
    image_updated_at: Faker::Time.between(2.years.ago, Date.today, :all)
    # tag_list: Faker::Lorem.words
  )
end

# Create ProjectPost
10.times do
  post = Post.create!(
    content_type: ProjectPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(33, 43)
  )
  ProjectPost.create!(
    id: post.content_id,
    title: Faker::HarryPotter.quote,
    body: Faker::Hacker.say_something_smart,
    link: Faker::Internet.url,
    repo: Faker::Internet.url('github.com'),
    # tag_list: Faker::ProgrammingLanguage.name
  )
end

# Create TextPost
10.times do
  post = Post.create!(
    content_type: TextPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(44, 54)
  )
  TextPost.create!(
    id: post.content_id,
    body:   Faker::TheFreshPrinceOfBelAir.quote,
    created_at: Faker::Time.between(2.years.ago, Date.today, :all)
    # tag_list: Faker::Lorem.words
  )
end

# Create Followers
300.times do
  FollowingRelationship.create!(
    follower: users.sample,
    followed_user: users.sample
  )
end


# Create Followering Relationship for admin
100.times do
  FollowingRelationship.create!(
    follower: User.first,
    followed_user: users.sample
  )
end

# Create Followering Relationship for will
100.times do
  FollowingRelationship.create!(
    follower: User.last,
    followed_user: users.sample
  )
end

# Create Likes
100.times do
  Like.create!(
    user_id: Faker::Number.unique.between(1, 100),
    post_id: Post.ids.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Like.count} likes created"
puts "#{FollowingRelationship.count} followers created"
