require 'rails_helper'


describe "Edit paper page", type: :feature do
  #edit paper page should exist and render without error
  it "should exist at 'edit_paper_path' and render without error" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
  end
  #values should be changed when an action has modified them and they are reloadod from the database
  it "should change values when an action has modified them and they are reloadod from the database" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    fill_in 'paper_title', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    fill_in 'paper_venue', with: 'Mind 49: 433-460'
    fill_in 'paper_year', with: '1950'
    find('input[type="submit"]').click
    @paper.reload
    expect(@paper.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(@paper.venue).to eq('Mind 49: 433-460')
    expect(@paper.year).to eq(1950)
  end
end
