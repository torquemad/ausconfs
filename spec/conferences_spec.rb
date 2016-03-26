require "rails_helper"

RSpec.describe Conference, :type => :model do

  before :each do
    @js_conf = Conference.new name: "JS Conf", date: "14/12/2016", summary: "A cool Javascript conference"
  end

  it "is a valid conference" do
    expect(@js_conf).to be_an_instance_of Conference
  end

end
