require 'spec_helper'

module Refinery
  module PastShows
    describe PastShow do
      describe "validations" do
        subject do
          FactoryGirl.create(:past_show,
          :year => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:year) { should == "Refinery CMS" }
      end
    end
  end
end
