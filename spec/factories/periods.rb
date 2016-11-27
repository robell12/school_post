FactoryGirl.define do
  factory :period do
    belongs_to "school"
    sequence :title do |n|
      "name_#{n}"
    end
    students "100"
  end
end
