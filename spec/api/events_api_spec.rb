require 'spec_helper'

describe Events::API do
  # GET api/v1/events
  describe "get event list" do
    it 'should get a list of latest events limited 20 records' do
      get '/api/v1/events'
      expect(JSON.parse(response.body)).to eq []
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

  # POST api/v1/events -d "event=new event"
  describe "create an event" do
    it 'should create an event with valid event info' do
      post "/api/v1/events", event:"new event"
      expect(response.status).to eq 201
    end
  end

  # POST api/v1/events -d "event=new event"
  describe "create an event" do
    it 'should not create an event with invalid parameter' do
      post "/api/v1/events", event: { title: "title" }
      expect(JSON.parse(response.body)).to eq({"error"=>"invalid parameter: event"})
    end
  end

  # PUT api/v1/events/1 -d "event=my event"
  describe "update an event" do
    it 'should update an event with event id and event info' do
      @id = '1'
      put '/api/v1/events/'+@id, event:"my event"
      expect(response.status).to eq 200  #accepted
    end
  end

  # DELETE api/v1/events/1
  describe "delete an event" do
    it 'should delete an event with event id' do
      @id = '1' 
      delete '/api/v1/events/'+@id
      expect(response.status).to eq 200  #accepted
    end
  end
end
