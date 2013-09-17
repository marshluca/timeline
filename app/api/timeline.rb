require "grape"

module Timeline
  class API < Grape::API
    version 'v1', using: :path
    format :json

    mount Events::API
  end
end
