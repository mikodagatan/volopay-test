FactoryBot.define do
  factory :flight do
    number { SecureRandom.hex(3).upcase }
  end
end
