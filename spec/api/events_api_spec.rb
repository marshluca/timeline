require 'spec_helper'

describe Events::API do

  # GET api/v1/events
  describe "get event list" do
    before do
      @events = FactoryGirl.create_list :event, 21
    end

    it 'should get a list of latest events limited 20 records' do
      get '/api/v1/events'
      @reponse_events = JSON.parse(response.body)

      expect(response.status).to eq 200   #OK
      expect(@reponse_events.length).to be <= 20
    end
  end

  # GET api/v1/events/1
  describe "get an event" do
    before do
      @event = FactoryGirl.create :event
    end

    it 'should get an event by id' do
      get '/api/v1/events/'+@event.id
      @response_event_id = JSON.parse(response.body)["_id"]

      expect(@response_event_id).to eq @event.id.to_s
    end
  end

  # POST api/v1/events -d "title=new event"
  describe "create an event" do
    it 'should create an event with valid event info' do
      post "/api/v1/events", title:"new event"
      expect(response.status).to eq 201
    end
  end

  # POST api/v1/events -d "invalid"
  describe "create an event" do
    it 'should not create an event with invalid parameter' do
      post "/api/v1/events", "invalid"
      expect(response.status).to eq 400
    end
  end

  # PUT api/v1/events/1 -d "title=my event"
  describe "update an event" do
    before do
      @event = FactoryGirl.create :event
    end

    it 'should update an event with event id and event info' do
      put '/api/v1/events/'+@event.id, title: @event.title
      expect(response.status).to eq 200  #OK
    end
  end

  # DELETE api/v1/events/1
  describe "delete an event" do
    before do
      @event = FactoryGirl.create :event
    end

    it 'should delete an event with event id' do
      delete '/api/v1/events/'+@event.id
      expect(response.status).to eq 200  #OK
    end
  end
end
