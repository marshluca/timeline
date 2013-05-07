require 'spec_helper'

describe Event do
  describe "Validation" do
    it 'has a valid factory' do
      FactoryGirl.create(:event).should be_valid
    end

    it 'is invalid without a title' do
      FactoryGirl.build(:event, title: nil).should_not be_valid
    end

    it 'is invalid without a category' do
      FactoryGirl.build(:event, category: nil).should_not be_valid
    end

    it 'is invalid without a duration' do
      FactoryGirl.build(:event, duration: nil).should_not be_valid
    end
  end
end
