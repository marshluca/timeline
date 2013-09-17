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
        "event list"
      end

      desc "Return an event."
      params do
        requires :id, type: Integer, desc: "Event id."
      end
      route_param :id do
        get do
          "event #{params[:id]}"
        end
      end

      desc "Create an event."
      params do
        requires :event, type: String, desc: "Your event."
      end
      post do
        "create an event with: #{params[:event]}"
      end

      desc "Update an event."
      params do
        requires :id, type: Integer, desc: "Event ID."
        requires :event, type: String, desc: "Your event."
      end
      put ':id' do
        "upate event #{params[:id]} with: #{params[:event]}"
      end

      desc "Delete an event."
      params do
        requires :id, type: Integer, desc: "Event ID."
      end
      delete ':id' do
        "delete event #{params[:id]}"
      end

    end
  end
end
