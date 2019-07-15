require "rails_helper"
# require 'spec_helper'

describe PostsController, type: :controller do
  render_views

  let(:user) { create(:user) }
  let(:posts) { FactoryBot.create_list :post, 2 }

  include AuthHelper
  before(:each) do
    http_login
  end
  
  describe "GET#index" do

    context 'log in' do
      before do
        login user
        get :index
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end

      it "renders the :index status" do
        response.status.should eql 200
      end

      it "match " do
        # posts = create(:post) 

        expect(assigns(:posts)).to match(posts)
      end
    end
  end
end