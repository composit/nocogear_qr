require 'spec_helper'

feature 'user can create an entry' do
  given(:success_message) { 'Your submission has been received' }
  given(:validation_message) { 'Name can\'t be blank' }

  scenario 'user sees a confirmation when she correctly enters all fields' do
    visit '/'
    fill_in 'Name', with: 'test name'
    fill_in 'Email', with: 'test email'
    fill_in 'Phone', with: 'test phone'
    fill_in 'Description', with: 'test description'
    click_button 'Submit'
    expect(page).to have_content(success_message)
    expect(page).to have_no_content(validation_message)
  end

  scenario 'user sees validation messages when she enters invalid information' do
    visit '/'
    click_button 'Submit'
    expect(page).to have_no_content(success_message)
    expect(page).to have_content(validation_message)
  end
end
