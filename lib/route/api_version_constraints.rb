# frozen_string_literal: true

module Route
  class ApiVersionConstraints
    attr_reader :version

    def initialize(version:, default: true)
      @version = Integer(version)
      @default = default.equal?(true)
    end

    def matches?(req)
      check_header?(req)
    end

    private

    def check_header?(req)
      version = req.headers['Accept']
                   .to_s
                   .split(';')[1]
                   .to_s
                   .strip

      version = '' if version.start_with?('q=')

      check_header_version?(version)
    end

    def check_header_version?(version)
      check_header_version_not_needed?(version) || header_accept_version.eql?(version)
    end

    def check_header_version_not_needed?(string)
      default? && string.empty?
    end

    def default?
      @default
    end

    def header_accept_version
      "version=#{version}"
    end
  end
end
