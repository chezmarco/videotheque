require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  describe "GET #hello" do
    it "responds successfully with an HTTP 200 status code" do
      get :hello
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  end
end
