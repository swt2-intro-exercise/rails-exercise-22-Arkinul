FactoryBot.define do
  factory :author do
     first_name { "Alan" }
     last_name { "Turing" }
     homepage { "http://wikipedia.org/Alan_Turing" }
  end
  #seconed author Grace Hopper
  factory :author2, class: Author do
      first_name { "Grace" }
      last_name { "Hopper" }
      homepage { "http://wikipedia.org/Grace_Hopper" }
  end
end
