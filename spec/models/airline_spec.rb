require 'rails_helper'

describe Airline, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  # describe "relationships" do
    # it {should have_many :flights}
    # it {should have_many(:passengers).through(:flights)}
  # end
end
