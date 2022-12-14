require 'rails_helper'

RSpec.describe Paper, type: :model do
  #should have a title, venue as a sting and year as an integer
  it "should have a title, venue as a sting and year as an integer" do
    paper = Paper.new(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: 1950)
    expect(paper.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(paper.venue).to eq('Mind 49: 433-460')
    expect(paper.year).to eq(1950)
  end
  #should have a list of authors
  it "should have a list of authors" do
    paper = Paper.new(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: 1950)
    expect(paper.authors).to eq([])
  end
end
