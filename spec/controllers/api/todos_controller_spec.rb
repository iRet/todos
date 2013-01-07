require 'spec_helper'

describe Api::TodosController do

  login_user

  before(:each) do
    Todo.delete_all
  end

  it "should get a todos list" do
    get 'index'
    response.should be_success
  end

  it "should create a new todo" do
    post 'create', :todo => {:title => 'test', :priority => 0}
    Todo.count.should == 1
  end

  it "should not create todo without title" do
    post 'create', :todo => {:priority => 0}
    Todo.count.should == 0
  end

end
