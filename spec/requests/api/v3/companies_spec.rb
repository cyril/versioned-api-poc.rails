require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let(:headers) do
    { "ACCEPT" => "application/vnd.example+json;version=3" }
  end

  describe "GET /companies" do
    before do
      get v3_companies_path, headers: headers
    end

    it "is OK" do
      expect(response).to have_http_status(200)
    end

    describe "#body" do
      let(:json) { response.body }
      let(:hash) { JSON.parse(json) }

      it "represents the resource" do
        expect(hash).to eq "version" => 3
      end
    end
  end
end
