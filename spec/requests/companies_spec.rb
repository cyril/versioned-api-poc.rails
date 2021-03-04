require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let(:headers) do
    { "ACCEPT" => "application/json" }
  end

  describe "GET /companies" do
    before do
      get companies_path, headers: headers
    end

    it "works!" do
      expect(response).to have_http_status(200)
    end
  end
end
