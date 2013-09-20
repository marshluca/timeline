require "grape"

module Events
  class API < Grape::API
    resource :events do

      # GET /events/(.json)
      # GET /events/:id(.json)
      # POST /events(.json)
      # PUT /events/:id(.json)
      # DELETE /events/:id(.json)

      desc "Return a list of events."
      get do
        @events = Event.all.limit(20).to_a
      end

      desc "Return an event."
      params do
        requires :id, type: String, desc: "Event id."
      end
      route_param :id do
        get do
          @event = Event.find(params[:id])
        end
      end

      desc "Create an event."
      params do
        requires :title, type: String, desc: "Your event."
      end
      post do
        @event = Event.create title: params[:title]
      end

      desc "Update an event."
      params do
        requires :id, type: String, desc: "Event ID."
        requires :title, type: String, desc: "Your event."
      end
      put ':id' do
        @event = Event.find(params[:id])
        @event.update_attributes title: params[:title]
        return @event
      end

      desc "Delete an event."
      params do
        requires :id, type: String, desc: "Event ID."
      end
      delete ':id' do
        @event = Event.find(params[:id])
        @event.delete
      end

    end
  end
end
