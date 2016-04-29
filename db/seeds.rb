# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed users table
5.times do
  password = Faker::Internet.password

  obj = User.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )

  puts "created #{obj.email}"
end

# seed materials with a few imdb movies
for i in 118884..118894
  imdb_object = Imdb::Movie.new("0#{i}")

  unless imdb_object.title == nil ||
         imdb_object.director == nil ||
         imdb_object.length == nil ||
         imdb_object.plot == nil ||
         imdb_object.release_date == nil

    obj = Material.create!(
      title: imdb_object.title,
      director: imdb_object.director.join(', '),
      runtime_in_minutes: imdb_object.length,
      description: imdb_object.plot,
      release_date: DateTime.parse(imdb_object.release_date)
    )

    puts "created #{obj.title}"
  end
end
