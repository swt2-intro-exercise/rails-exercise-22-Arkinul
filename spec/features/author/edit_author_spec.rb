require 'rails_helper'
#edit author page should exist and render without error
describe "Edit author page", type: :feature do
  #edit author page should exist and render without error
  it "should exist at 'edit_author_path' and render without error" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end
  #values should be changed when an action has modified them and they are reloadod from the database
  it "should change values when an action has modified them and they are reloadod from the database" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    fill_in 'author_first_name', with: 'Alan Mathison'
    fill_in 'author_last_name', with: 'Turing'
    fill_in 'author_homepage', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    @alan.reload
    expect(@alan.first_name).to eq('Alan Mathison')
    expect(@alan.last_name).to eq('Turing')
    expect(@alan.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end
end