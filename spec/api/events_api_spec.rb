require 'spec_helper'

describe Events::API do

  describe "GET /api/v1/events" do
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

  describe "GET /api/v1/events/:id" do
    before do
      @event = FactoryGirl.create :event
    end

    it 'should get an event by id' do
      get '/api/v1/events/'+@event.id
      @response_event_id = JSON.parse(response.body)["_id"]

      expect(@response_event_id).to eq @event.id.to_s
    end
  end

  describe "POST /api/v1/events" do
    it 'should create an event with valid event info' do
      post "/api/v1/events", title: "new event"
      expect(response.status).to eq 201
    end

    it 'should not create an event with invalid parameter' do
      post "/api/v1/events", "invalid"
      expect(response.status).to eq 400
    end
  end

  describe "PUT /api/v1/events/:id" do
    before do
      @event = FactoryGirl.create :event
    end

    it 'should update an event with event id and event info' do
      put '/api/v1/events/'+@event.id, title: @event.title
      expect(response.status).to eq 200  #OK
    end
  end

  describe "DELETE /api/v1/events/:id" do
    before do
      @event = FactoryGirl.create :event
    end

    it 'should delete an event with event id' do
      delete '/api/v1/events/'+@event.id
      expect(response.status).to eq 200  #OK
    end
  end
end
