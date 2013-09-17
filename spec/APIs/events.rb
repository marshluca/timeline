require 'spec_helper'

describe Events::API, :type => :feature do
  describe "get event list" do
    it 'should get a list of latest events limited 20 records' do
      visit '/timeline/v1/events'
      page.should have_content 'event list'
    end
  end

  describe "get an event" do
    it 'should get an event by id' do
      @id = '1'
      visit '/timeline/v1/events/'+@id
      page.should have_content 'event '+@id
    end
  end

  describe "create an event" do
    it 'should create an event with event info' do
      page.driver.browser.post '/timeline/v1/events/', event:"new event", format:"json"
      page.driver.status_code.should eql 201  #created
    end
  end
end
