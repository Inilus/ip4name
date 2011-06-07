require 'spec_helper'

describe User do

  describe "correct value" do

    describe "success" do
      it "should have name more 4 and less 256 chapters" do
        user = User.new( :name => 255 * "n", :email => "email.example.com" )
        response.should user.name.size < 256  and > 4
      end

    end

    describe "failed" do
      it "should not have name more 255 chapters" do
        user = User.new( :name => 255 * "n", :email => "email.example.com" )
        user.name.size.should_not  < 256
      end
    end

  end

end

