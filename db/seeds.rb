users = []
1.times do
  users << User.create!(
    name: 'Test user',
    email: "test_user@gmail.com",
    password: '12345678',
    password_confirmation: '12345678'
  )
end

users.each do |user|
  5.times do
    Task.create!(
      name: Faker::Lorem.sentence(word_count: 3),
      due_date: Faker::Date.forward(days: 30),
      completed: [true, false].sample,
      user: user
    )
  end
end