# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "a", tag: "a", is_guest?: true, password: "password"
User.create(email: "b", tag: "b", is_guest?: true, password: "password"
User.create(email: "c", tag: "c", is_guest?: true, password: "password"
User.create(email: "d", tag: "d", is_guest?: true, password: "password"
User.create(email: "e", tag: "e", is_guest?: true, password: "password"
User.create(email: "f", tag: "f", is_guest?: true, password: "password"
User.create(email: "g", tag: "g", is_guest?: true, password: "password"
User.create(email: "h", tag: "h", is_guest?: true, password: "password"

Tournament.create(creator_id: 1, tournament_name: "Andross Cup", date_start: Time.now, date_end: Time.now, is_published?: true, :is_finished?: true, has_started?: true)
Tournament.create(creator_id: 2, tournament_name: "Laiqi Cup", date_start: Time.now, date_end: Time.now, is_published?: true, :is_finished?: true, has_started?: true)
