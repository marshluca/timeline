__END__
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
end

feature 'Vistor signs in' do
  scenario 'with valid email and password' do
    sign_in_with_default
    expect(page).to have_content('Home#index')
  end

  scenario 'with incorrect password' do
    sign_in_with('marshluca@gmail.com', '123456')
    expect(page).to have_content('Sign in')
  end
end
