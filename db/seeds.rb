# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bruce = Teacher.create!(name: "Bruce Lee", email: "bruce@water.com", password: "brucelee")
ipman = Teacher.create!(name: "Ip Man", email: "ipman@taichi.com", password: "ipman")

jet = Student.create!(name: "Jet Li", email: "jet@kungfu.com", password: "jet", teacher_id: 1)
don = Student.create!(name: "Donatello ", email: "don@sewer.com", password: "don", teacher_id: 2)

splinter = Parent.create!(name: "Splinter", email: "splinter@sewer.com", password: "splinter", student_id: 2)
raiden = Parent.create!(name: "Raiden", email: "raiden@cloud.com", password: "raiden", student_id: 1)

bruce.students << jet
impan.students << don

jet.parents << raiden
don.parents << splinter

bruce.save
ipman.save
don.save
jet.save
