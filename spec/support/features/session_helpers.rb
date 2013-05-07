module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in_with(email='marshluca@gmail.com', password='zaq12wsx')
      User.create(email: email, password: password, password_confirmation: password)

      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end

    alias :sign_in_with_default :sign_in_with
  end
end
