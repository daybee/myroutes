# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Route.create([
  {
    id: 1,
    title: "いつものコース",
    description: "よくウォーキングで歩いていたコース"
  }, {
    id: 2,
    title: "きついコース",
    description: "調子に乗って走って膝痛めたコース"
  }, {
    id: 3,
    title: "うぉーきんぐコース",
    description: "またしばらくウォーキングに戻そう・・・"
  }, {
    id: 4,
    title: "皇居ラン",
    description: "皇居の周りハシリターイ"
  }, {
    id: 5,
    title: "最初のコース",
    description: "ウォーキング初めてすぐの頃のコース"
  }
])

Coordinate.create([
  {route_id: 1, sequential_id: 1, latitude: 10, longitude: 10},
  {route_id: 1, sequential_id: 2, latitude: 10, longitude: 10},
  {route_id: 1, sequential_id: 3, latitude: 10, longitude: 10},
  {route_id: 1, sequential_id: 4, latitude: 10, longitude: 10},
  {route_id: 1, sequential_id: 5, latitude: 10, longitude: 10},
  {route_id: 2, sequential_id: 1, latitude: 10, longitude: 10},
  {route_id: 2, sequential_id: 2, latitude: 10, longitude: 10},
  {route_id: 2, sequential_id: 3, latitude: 10, longitude: 10},
  {route_id: 2, sequential_id: 4, latitude: 10, longitude: 10},
  {route_id: 2, sequential_id: 5, latitude: 10, longitude: 10},
  {route_id: 3, sequential_id: 1, latitude: 10, longitude: 10},
  {route_id: 3, sequential_id: 2, latitude: 10, longitude: 10},
  {route_id: 3, sequential_id: 3, latitude: 10, longitude: 10},
  {route_id: 3, sequential_id: 4, latitude: 10, longitude: 10},
  {route_id: 3, sequential_id: 5, latitude: 10, longitude: 10},
  {route_id: 4, sequential_id: 1, latitude: 10, longitude: 10},
  {route_id: 4, sequential_id: 2, latitude: 10, longitude: 10},
  {route_id: 4, sequential_id: 3, latitude: 10, longitude: 10},
  {route_id: 4, sequential_id: 4, latitude: 10, longitude: 10},
  {route_id: 4, sequential_id: 5, latitude: 10, longitude: 10},
  {route_id: 5, sequential_id: 1, latitude: 10, longitude: 10},
  {route_id: 5, sequential_id: 2, latitude: 10, longitude: 10},
  {route_id: 5, sequential_id: 3, latitude: 10, longitude: 10},
  {route_id: 5, sequential_id: 4, latitude: 10, longitude: 10},
  {route_id: 5, sequential_id: 5, latitude: 10, longitude: 10},
])