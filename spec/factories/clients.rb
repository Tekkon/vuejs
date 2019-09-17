FactoryBot.define do
  factory :client do
    email { FFaker::Internet.free_email }
    password { FFaker::Internet.password }
  end
end
