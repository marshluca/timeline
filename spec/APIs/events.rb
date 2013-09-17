require 'spec_helper'

describe Events::API, :type => :feature do
  # GET timeline/v1/events
  describe "get event list" do
    it 'should get a list of latest events limited 20 records' do
      visit '/timeline/v1/events'
      page.should have_content 'event list'
    end
  end

  # GET timeline/v1/events/1
  describe "get an event" do
    it 'should get an event by id' do
      @id = '1'
      visit '/timeline/v1/events/'+@id
      page.should have_content 'event '+@id
    end
  end

  # POST timeline/v1/events -d "event=new event"
  describe "create an event" do
    it 'should create an event with event info' do
      page.driver.browser.post '/timeline/v1/events/', event:"new event", format:"json"
      page.driver.status_code.should eql 201  #created
    end
  end

  # PUT timeline/v1/events/1 -d "event=my event"
  describe "update an event" do
    it 'should update an event with event id and event info' do
      @id = '1'
      page.driver.browser.put '/timeline/v1/events/'+@id, event:"my event", format:"json"
      page.driver.status_code.should eql 200  #accepted
    end
  end

  # DELETE timeline/v1/events/1
  describe "delete an event" do
    it 'should delete an event with event id' do
      @id = '1' 
      page.driver.browser.delete '/timeline/v1/events/'+@id, format:"json"
      page.driver.status_code.should eql 200  #accepted
    end
  end
end
