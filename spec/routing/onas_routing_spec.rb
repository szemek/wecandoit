require "spec_helper"

describe OnasController do
  describe "routing" do

    it "routes to #index" do
      get("/onas").should route_to("onas#index")
    end

    it "routes to #new" do
      get("/onas/new").should route_to("onas#new")
    end

    it "routes to #show" do
      get("/onas/1").should route_to("onas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/onas/1/edit").should route_to("onas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/onas").should route_to("onas#create")
    end

    it "routes to #update" do
      put("/onas/1").should route_to("onas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/onas/1").should route_to("onas#destroy", :id => "1")
    end

  end
end
