# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    content "MyText"
    url "http://www.example.com"
    current_clicks 0
    allowed_clicks 10
    user
  end
end
