require 'rails_helper'

feature "sign in" do
    let(:user) {FactoryGirl.create(:user)}

    def fill_in_sign_in_fields
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
        click_button "Log in"
    end

    scenario "visit the site to sign in" do
        visit root_path
        click_link "Sign in"
        fill_in_sign_in_fields
        expect(page).to have_content("pricing")
    end
end
