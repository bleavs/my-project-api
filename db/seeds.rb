# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = HTTParty.get('https://randomuser.me/api/?results=50').parsed_response["results"]

people.each do |person|
  User.create(
    password: person['login']['password'],
    first: person['name']['first'],
    last: person['name']['last'],
    city: person['location']['city'],
    state: person['location']['state'],
    title: person['name']['title'],
    picture: person['picture']['large'],
    gender: person['gender'],
    postcode: person['location']['postcode'],
    street: person['location']['street']
  )

end
