require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "Home Integration Test" do
  describe "home#index" do
    before do
      get '/'
    end

    it { must_respond_with :success }

    it "home index page must be accessible" do
      page.must_have_content("Home#index")
    end
  end
end
