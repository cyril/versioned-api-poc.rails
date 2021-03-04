require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /companies" do
    before do
      get v2_companies_path
    end

    it "is OK" do
      expect(response).to have_http_status(200)
    end

    describe "#body" do
      let(:json) { response.body }
      let(:hash) { JSON.parse(json) }

      it "represents the resource" do
        expect(hash).to eq "version" => 2
      end
    end
  end
end
