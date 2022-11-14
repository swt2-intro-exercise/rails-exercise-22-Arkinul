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
  #should contain a multiselect box for selecting authors
  it "should contain a multiselect box for selecting authors" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_select('paper_author_ids')
  end
  #select multiple authors and save paper
  it "should select multiple authors and save paper" do
    #create paper
    @paper = FactoryBot.create :paper
    #create Alan Turing and Grace Hopper
    @alan = FactoryBot.create :author
    @grace = FactoryBot.create :author2
    #visit edit page
    visit edit_paper_path(@paper)
    #select Alan Turing and Grace Hopper in the multiselect box
    select(@alan.name, from: 'paper_author_ids')
    select(@grace.name, from: 'paper_author_ids')
    #save paper
    find('input[type="submit"]').click
    #check if paper has 2 authors
    expect(@paper.authors.count).to eq(2)
  end
end
