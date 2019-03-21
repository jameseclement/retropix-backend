require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

10.times do
  user = User.create!(
    username: Faker::Internet.username(Faker::Artist.name, %w(_ -)),
    password: '123'
  )

  5.times do
    doc = Document.create!(user: user, title: Faker::Book.title)

    Faker::Number.between(1, 6).times do
      Version.create!(
        document: doc, 
        data: Faker::Json.shallow_json(3, key: 'Music::RockBand.name', value: 'TvShows::Seinfeld.quote')
      )
    end
  end
end

