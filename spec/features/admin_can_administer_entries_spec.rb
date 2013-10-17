require 'spec_helper'

feature 'user connot see entries if they are not logged in' do
  given(:entry) { create(:entry, name: 'test entry') }

  scenario 'user cannot see list of entries' do
    visit '/admin/entries'
    expect(page).to have_no_content('test entry')
    expect(page).to have_content('Please sign in')
  end

  scenario 'user cannot see individual entries' do
    visit admin_entry_url(entry)
    expect(page).to have_no_content('test entry')
    expect(page).to have_content('Please sign in')
  end
end

feature 'logged in admin' do
  given(:admin) { create(:admin) }
  given(:entry1) { create(:entry, name: 'test entry 1') }
  given(:entry2) { create(:entry, name: 'test entry 2') }

  before { session[:admin_id] = admin.id }

  scenario 'can see a list of entries' do
    visit '/admin/entries'
    expect(page).to have_content('test entry 1')
    expect(page).to have_content('test entry 2')
  end
  scenario 'can see individual entries'
end
