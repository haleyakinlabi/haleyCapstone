# frozen_string_literal: true

def create_user(attributes)
  user = User.find_or_create_by(attributes)
  user.password = "password"
  user.save
end

# cats
list = [
  {username: "binx", email: "binx@example.com", species: "cat", breed: ""},
  {username: "buttercup", email: "buttercup@example.com", species: "cat", breed: "tabby"},
  {username: "milo", email: "milo@example.com", species: "cat", breed: "tabby"},
  {username: "sassy", email: "sassy@example.com", species: "cat", breed: "himalayan"}
]
list.each { |attributes| create_user attributes }

# dogs
list = [
  {username: "bingo", email: "bingo@example.com", species: "dog", breed: "otterhound"},
  {username: "chance", email: "chance@example.com", species: "dog", breed: "bulldog"},
  {username: "lassie", email: "lassie@example.com", species: "dog", breed: "collie"},
  {username: "otis", email: "otis@example.com", species: "dog", breed: "pug"},
  {username: "shadow", email: "shadow@example.com", species: "dog", breed: "golden retriever"},
  {username: "toto", email: "toto@example.com", species: "dog", breed: "terrier"}
]
list.each { |attributes| create_user attributes }

# milo & otis friend group
milo = User.find_by(username: "milo")
otis = User.find_by(username: "otis")
milo.followers << otis unless milo.followers.where(id: otis).exists?
otis.followers << milo unless otis.followers.where(id: milo).exists?

# homeward bound friend group
chance = User.find_by(username: "chance")
sassy = User.find_by(username: "sassy")
shadow = User.find_by(username: "shadow")
chance.followers << sassy unless chance.followers.where(id: sassy).exists?
chance.followers << shadow unless chance.followers.where(id: shadow).exists?
sassy.followers << chance unless sassy.followers.where(id: chance).exists?
sassy.followers << shadow unless sassy.followers.where(id: shadow).exists?
shadow.followers << chance unless shadow.followers.where(id: chance).exists?
shadow.followers << sassy unless shadow.followers.where(id: sassy).exists?

# posts
chance.posts.find_or_create_by(body: "There's nothing you can't do.")
sassy.posts.find_or_create_by(body: "Even a great beauty needs her beauty sleep!")
chance.posts.find_or_create_by(body: "Shadow was faithful, Shadow was loyal... Shadow was a chump.")
sassy.posts.find_or_create_by(body: "Curiosity killed the dog.")
shadow.posts.find_or_create_by(body: "We'll make it!")
chance.posts.find_or_create_by(body: "You're not going to quit, not now, not when we're this close.")
shadow.posts.find_or_create_by(body: "You've got a lot to learn, pup.")
sassy.posts.find_or_create_by(body: "Cats rule and dogs drool.")
shadow.posts.find_or_create_by(body: "I have nothing more to give.")
