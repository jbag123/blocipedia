require 'rails_helper'

RSpec.describe User, type: :model do
    describe "after create" do
      it "sends a confirmation email" do
          user = FactoryGirl.build :user
          expect { user.save }.to change(
              Devise.mailer.deliveries, :count
          ).by(1)
      end
    end

    describe "login" do
      it "rejects duplicate emails" do
          user = FactoryGirl.build :user
          Devise.mailer.deliveries.find_each do |f|
            expect(user.email).to not_to eq.f
          end
      end
    end
end
