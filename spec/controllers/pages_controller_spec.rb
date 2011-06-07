require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get :home
      response.should have_selector( "title", :content => "IP name | Home" )
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'rules'" do
    it "should be successful" do
      get 'rules'
      response.should be_success
    end
  end

  describe "GET 'license'" do
    it "should be successful" do
      get 'license'
      response.should be_success
    end
  end

end

