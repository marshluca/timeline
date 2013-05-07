require 'spec_helper'

feature 'Vistor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'nilgnahz@gmail.com', 'zaq12wsx'
    expect(page).to have_content('Home#index')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'nilgnahz@gmail', ''
    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end
end

feature 'Vistor signs in' do
  before do
    User.create(
      :email => 'marshluca@gmail.com',
      :password => 'zaq12wsx',
      :password_confirmation => 'zaq12wsx'
    )
  end

  scenario 'with valid email and password' do
    sign_in_with 'marshluca@gmail.com', 'zaq12wsx'
    expect(page).to have_content('Home#index')
  end

  scenario 'with incorrect password' do
    sign_in_with 'marshluca@gmail', 'password'
    expect(page).to have_content('Sign in')
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end
end
