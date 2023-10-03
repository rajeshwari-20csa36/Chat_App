
require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context "when user is signed in" do
    let(:user) { User.create(email: 'user@example.com', password: 'password') }

    before { sign_in user }

    it "renders the index template" do
      get users_path
      expect(response).to render_template(:index)
    end

    it "assigns @users with all users except the current user" do
      other_user = User.create(email: 'other@example.com', password: 'password')
      get users_path
      expect(assigns(:users)).to include(other_user)
      expect(assigns(:users)).not_to include(user)
    end
  end

  context "when user is not signed in" do
    it "redirects to the sign-in page" do
      get users_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
