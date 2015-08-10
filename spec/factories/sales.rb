FactoryGirl.define do
  factory :sale do
    discount  { rand(1..6) * 5 }
    quantity  { rand(2..5) }
    title     { "When you buy #{quantity} pieces or more #{discount}% discount." }
  end
end
