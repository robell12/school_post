FactoryGirl.define do
  factory :school do
    sequence :name do |n|
      "name_#{n}"
    end
    rooms "alot"
  end
end
