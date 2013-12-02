require 'spec_helper'

describe DirectivesController do

  describe "GET 'applyBox'" do
    it "returns http success" do
      get 'applyBox'
      response.should be_success
    end
  end

end
