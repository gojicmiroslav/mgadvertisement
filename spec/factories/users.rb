FactoryGirl.define do
	
	factory :user do
    transient do
      skip_confirmation true
    end

    firstname "Miroslav"
    lastname "Gojic"
    email    Faker::Internet.email
    password "please123"
    
    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end
  end

  factory :other_user, :parent => :user do
    transient do
      skip_confirmation true
    end

    firstname "Pera"
    lastname "Peric"
    email Faker::Internet.email
    password "please123"
    
    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end
  end
end