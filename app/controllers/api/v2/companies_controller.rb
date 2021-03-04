require_relative 'base_controller'

module Api
  module V2
    class CompaniesController < ::Api::V2::BaseController
      def show
        render status: 200, json: { version: 2 }
      end
    end
  end
end
