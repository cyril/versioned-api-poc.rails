# frozen_string_literal: true

module Route
  class ApiConstraints
    def self.header_accept_application
      'application/json'
    end

    def matches?(req)
      check_header_applications?(*applications(req))
    end

    private

    def applications(req)
      req
        .headers['Accept']
        .to_s
        .split(';')
        .first
        .to_s
        .split(',')
        .map(&:strip)
    end

    def check_header_applications?(*applications)
      applications.any? do |application|
        self.class.header_accept_application.eql?(application)
      end
    end
  end
end
