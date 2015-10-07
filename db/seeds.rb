# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.create(name: "Bruce Lee", email: "bruce@water.com", password: "brucelee")
Teacher.create(name: "Ip Man", email: "ipman@taichi.com", password: "ipman")
Student.create(name: "Da-Me", email: "damenatekim@awesome.com", password: "damekim", teacher_id: 1)
