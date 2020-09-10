# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Collection.create([
#     {name:"260 Sample Sale", category:"Shopping", description:"Sample sale information", source:"https://www.260samplesale.com/"},
#     {name:"Cash Back Holic", category:"Money Habits", description:"Cash back and points reward comparison", source:"http://www.cashbackholic.com/"},
#     {name:"Cash Back Monitor", category:"Money Habits", description:"Cash back and points reward comparison", source:"https://www.cashbackmonitor.com/"},
#     {name:"Chicmi", category:"Shopping", description:"Sample sale and fashion events information", source:"https://www.chicmi.com/new-york/"}
# ])

# User.create(username:"a", password:"password")

i = 1 
while i < 20 do
    User.create(username: "User#{i}", password_digest: BCrypt::Password.create("Password#{i}"));
    i+=1
 end

User.all.each do |user|
    Collection.create([
        {name:"260 Sample Sale(#{user.id})", category:"Shopping", description:"Sample sale information", source:"https://www.260samplesale.com/", user_id:"#{user.id}"},
        {name:"Cash Back Holic(#{user.id})", category:"Money Habits", description:"Cash back and points reward comparison", source:"http://www.cashbackholic.com/", user_id:"#{user.id}"},
        {name:"Cash Back Monitor(#{user.id})", category:"Money Habits", description:"Cash back and points reward comparison", source:"https://www.cashbackmonitor.com/", user_id:"#{user.id}"},
        {name:"Chicmi(#{user.id})", category:"Shopping", description:"Sample sale and fashion events information", source:"https://www.chicmi.com/new-york/", user_id:"#{user.id}"}
    ])
end