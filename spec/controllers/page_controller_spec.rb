require 'spec_helper'

describe PageController do

  before(:each) do
    @base_title = "Timeline"
  end
  
  describe "GET 'welcome'" do
    it "should be successful" do
      get 'welcome'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'welcome'
      response.should have_selector("title",
                                    :content => "#{@base_title} | #{@title}")
    end
  end

end
