# spec/factories/tasks.rb

FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    due_date { Faker::Date.forward(days: 23) }
    completed { false }
    association :user
  end
end
