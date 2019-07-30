require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do 
        it "render the page for user to sign-up" do
            get :new, {}
            expect(response).to render_template(:new)
        end
    end
    
    describe "POST #create" do 
        context "invalid params" do 
            it "validates the presence of username and password" do
                post :create, params: {user: {username: "lmcfarlin", password: ""}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present 
            end 

            it "validates the password is at least 6 chars long" do
                post :create, params: {user: {username: "lmcfarlin", password: "123"}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
        
        context "valid params" do 
            it "rediriect to goals index page" do 
                 post :create, params: {user: {username: "lmcfarlin", password: "password"}}
                 expect(response).to rediriect_to(goals_url)
            end 
        end
    end  


end
