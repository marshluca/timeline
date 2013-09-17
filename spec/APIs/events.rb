require 'spec_helper'

describe Events::API, :type => :feature, :driver => :selenium do
  describe "get event list" do
    it 'should get a list of latest events limited 20 records' do
      visit 'http://localhost:3000/timeline/v1/events'
      page.should have_content 'event list'
    end
  end

  describe "get an event" do
    it 'should get an event by id' do
      @id = '1'
      visit 'http://localhost:3000/timeline/v1/events/'+@id
      page.should have_content 'event '+@id
    end
  end
end
