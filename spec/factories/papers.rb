FactoryBot.define do
  factory :paper do
    title {"COMPUTING MACHINERY AND INTELLIGENCE"}
    venue {"Mind 49: 433-460"}
    year {1950}
    #authors {build_list :author, 1}
  end
  #second paper with different year
  factory :paper2, class: Paper do
    title {"COMPUTING MACHINERY AND INTELLIGENCE2"}
    venue {"Mind 49: 433-460"}
    year {1951}
    #authors {build_list :author, 1}
  end
end