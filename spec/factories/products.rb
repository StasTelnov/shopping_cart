FactoryGirl.define do
  factory :product do
    title       { Faker::Commerce.product_name }
    price       { Money.new(rand(100..10000)) }
    description { Faker::Lorem.paragraph(3) }
    image_url   { 'coffee_and_tea.jpg' }
  end
end
