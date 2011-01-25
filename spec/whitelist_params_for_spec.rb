require File.join(File.dirname(__FILE__), 'spec_helper')

describe "whitelist_params_for" do
  include RSpec::Rails::ControllerExampleGroup

  def data_param
    {
      'title' => "Mr",
      'name' => "Glen Mailer",
      'status' => "admin",
      'email' => "glen@epigenesys.co.uk",
    }
  end

  context "unfiltered" do
    controller do
      def index
        @hash = params[:data]
        stub!
      end
    end

    it "should have title, name, status and email" do
      post :index, :data => data_param
      assigns(:hash).should include 'title', 'name', 'status', 'email'
    end
  end

  context "create allows title, name, email" do
    controller do
      whitelist_params_for :data,
        :create => [:title, :name, :email]

      def index
        @hash = params[:data]
        stub!
      end
      def create
        @hash = params[:data]
        stub!
      end
    end

    example "create removes status" do
      post :create, :data => data_param
      assigns(:hash).should     include 'title', 'name', 'email'
      assigns(:hash).should_not include 'status'
    end
    example "index doesn't remove status" do
      post :index, :data => data_param
      assigns(:hash).should include 'title', 'name', 'email', 'status'
    end
  end

  context "create allows title, name; index allows email, status" do
    controller do
      whitelist_params_for :data,
        :index  => [:email, :status],
        :create => [:title, :name]

      def index
        @hash = params[:data]
        stub!
      end
      def create
        @hash = params[:data]
        stub!
      end
    end

    example "create removes email and status" do
      post :create, :data => data_param
      assigns(:hash).should     include 'title', 'name'
      assigns(:hash).should_not include 'email', 'status'
    end
    example "index removes title and name" do
      post :index, :data => data_param
      assigns(:hash).should     include 'email', 'status'
      assigns(:hash).should_not include 'title', 'name'
    end
  end

  context "create and index allows title and name" do
    controller do
      whitelist_params_for :data,
        [:index, :create] => [:title, :name]

      def index
        @hash = params[:data]
        stub!
      end
      def create
        @hash = params[:data]
        stub!
      end
    end

    example "create removes email and status" do
      post :create, :data => data_param
      assigns(:hash).should     include 'title', 'name'
      assigns(:hash).should_not include 'email', 'status'
    end
    example "index removes email and status" do
      post :index, :data => data_param
      assigns(:hash).should     include 'title', 'name'
      assigns(:hash).should_not include 'email', 'status'
    end
  end

end
