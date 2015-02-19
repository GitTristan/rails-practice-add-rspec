require 'rails_helper'

feature 'Events' do

  scenario 'User sees headline' do

    visit root_path
    expect(page).to have_content('Events')
  end

  scenario 'User can see a list of events' do
    Event.create!(description: 'My awesome event')

    visit root_path
    expect(page).to have_content('My awesome event')
  end


  scenario 'User edits an event' do
    Event.create!(
      description: 'My aweeesome event'
    )

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'

    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')
  end

  scenario 'User can delete an event' do
    Event.create!(description: 'My aweeesome event')

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'delete'
    expect(page).to have_no_content('My aweeesome event')
  end




end
