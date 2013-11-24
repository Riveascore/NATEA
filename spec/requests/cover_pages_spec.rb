require 'spec_helper'

describe "CoverPages" do
  describe "GET /cover_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cover_pages_index_path
      expect(response.status).to be(200)
    end
  end
end
