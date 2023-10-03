require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have valid factories" do
    user = User.create(email: 'user@example.com', password: 'password')
    expect(user).to be_valid
  end
end
