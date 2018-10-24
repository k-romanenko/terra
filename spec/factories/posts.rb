FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Title_#{n}" }
    sequence(:body) { |n| "Post_body_#{n}" }
    sequence(:author_ip) { |n| "Test_ip_#{n}" }
  end
end
