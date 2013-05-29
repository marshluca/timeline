require 'spec_helper'

describe SettingsController do

  describe "GET 'profile'" do
    it "returns http success" do
      get 'profile'
      response.should be_success
    end
  end

  describe "GET 'password'" do
    it "returns http success" do
      get 'password'
      response.should be_success
    end
  end

end
