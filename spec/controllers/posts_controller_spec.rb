require 'rails_helper.rb'

RSpec.describe PostsController, type: :controller do

    describe 'GET #index' do
        subject {get :index}

        context "when user is not logged in" do
            it "redirects to login page" do
                subject
                expect(response).to redirect_to(new_user_session_path)
            end
        end

    end
end