require 'rails_helper'
require 'spec_helper'
 

RSpec.describe User, type: :model do
  
  it "is invalid without an email"
  it "has unique email"
  it "is invalid without a name"
 
  it { is_expected.to have_many(:orders) } 
 
  context ".admins" do
    it "returns list of admins"
    it "doesn't return regular users"
  end
 
  context "change email" do
    it "sends email changed notification"
    it "doesn't send email changed notification"
  end
end
