require 'spec_helper'

feature 'user connot see entries if they are not logged in' do
  background do
    create(:entry, name: 'test entry')
  end

  scenario 'user cannot see list of entries' do
    visit '/admin/entries'
    expect(page).to have_no_content('test entry')
    expect(page).to have_content('Please sign in')
  end

  scenario 'user cannot see individual entries'
end
feature 'admin can see list of entries'
feature 'admin can see individual entries'
