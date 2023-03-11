FactoryBot.define do
    factory :post do 
        association :user
        title {FFaker::Lorem.sentence}
        body {FFaker::Lorem.paragraph}
        photo {Rack::Test::UploadedFile.new (Rails.root.join("app/assets/images/default-avatar.png"))}
    end
end