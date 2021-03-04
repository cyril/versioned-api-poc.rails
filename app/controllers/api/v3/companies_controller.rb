require_relative 'base_controller'

module Api
  module V3
    class CompaniesController < ::Api::V3::BaseController
      def show
        render status: 200, json: { version: 3 }
      end
    end
  end
end
