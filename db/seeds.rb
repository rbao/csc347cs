# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env != 'dummy'
  ActiveRecord::Base.transaction do
    User.create!(email: 'admin@example.com', name: 'Admin', password: 'test1234', password_confirmation: 'test1234')
    User.create!(email: 'user1@example.com', name: 'User1', password: 'csc347user1', password_confirmation: 'csc347user1')
    User.create!(email: 'user2@example.com', name: 'User2', password: 'csc347user2', password_confirmation: 'csc347user2')
    Feedback.create!(name: 'Roy', phone: '1234567890', email: 'roy@example.com', description: 'Make the website look better!')
  end
else
  ActiveRecord::Base.transaction do
    sql = "ALTER TABLE users CHANGE encrypted_password password VARCHAR(255)"
    ActiveRecord::Base.connection.execute(sql)

    sql = "INSERT INTO users (email, password) VALUES ('admin11@example.com', 'fgkejnbdl83nfbdkeif')"
    ActiveRecord::Base.connection.execute(sql)

    sql = "INSERT INTO users (email, password) VALUES ('user23@example.com', 'user1')"
    ActiveRecord::Base.connection.execute(sql)
  end
end
