FactoryGirl.define do
  factory :group_item do
    association :group
    # Because a group is groupable we use groups here
    association :groupable, factory: :group
  end
end