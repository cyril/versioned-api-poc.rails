require_relative 'base_controller'

module Api
  module V4
    class CompaniesController < ::Api::V4::BaseController
      def show
        render status: 200, json: { version: 4 }
      end
    end
  end
end
