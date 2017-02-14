require 'rails_helper'

describe 'Application layout' do

  describe 'User controls' do
    before do
      sign_in user unless user.blank?
      render template: 'layouts/application.html.erb'
    end
    
    context 'When logged out' do
      let(:user) { nil }
      
      it 'Renders login/signup links' do
        expect(rendered).to have_link 'Login', href: new_user_session_path
        expect(rendered).to have_link 'Sign Up', href: new_user_registration_path
      end
    end

    context 'When logged in' do
      let(:user) { FactoryGirl.create(:user) }

      it 'Renders user controls' do
        expect(rendered).to have_link "#{user.username}", href: '#'
        expect(rendered).to have_link 'Profile', href: edit_user_registration_path(user)
        expect(rendered).to have_link 'Logout', href: destroy_user_session_path
      end
    end
  end
end