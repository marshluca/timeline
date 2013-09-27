require "grape"

module Timeline
  class API < Grape::API
    version 'v1', using: :path
    format :json
    formatter :json, Grape::Formatter::Jbuilder

    mount Events::API
  end
end
