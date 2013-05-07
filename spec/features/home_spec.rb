require 'spec_helper'

describe "Home" do
  describe "GET /about" do
    it "should have content 'Home#about'" do
      visit about_path
      page.should have_content 'Home#about'
    end
  end

  describe "GET /feedback" do
    it "should have content 'Home#feedback'" do
      visit feedback_path
      page.should have_content 'Home#feedback'
    end
  end
end
