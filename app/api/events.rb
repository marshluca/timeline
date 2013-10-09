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
      get '', jbuilder: 'events' do
        @events = Event.all.limit(20).to_a
      end

      desc "Return an event."
      params do
        requires :id, type: String, desc: "Event id."
      end
        get ':id', jbuilder: 'event' do
          @event = Event.find(params[:id])
        end

      desc "Create an event."
      params do
        requires :event, type: Hash, desc: "Event info."
      end
      post '', jbuilder: 'event' do
        @event = Event.create params[:event]
      end

      desc "Update an event."
      params do
        requires :id, type: String, desc: "Event id."
        requires :event, type: Hash, desc: "Event info."
      end
      put ':id', jbuilder: 'event' do
        @event = Event.find(params[:id])
        @event.update_attributes params[:event]
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
