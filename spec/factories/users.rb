FactoryBot.define do
  factory :user do
    first_name { SecureRandom.base64(5) }
    last_name { SecureRandom.base64(5) }
    email { "#{SecureRandom.hex(6)}gmail.com" }
    mobile { SecureRandom.random_number(1e10) }
    gender { ['male','female','other'].sample }
    role { ['buyer','seller'].sample }
    password { 'password1' }
  end
end
