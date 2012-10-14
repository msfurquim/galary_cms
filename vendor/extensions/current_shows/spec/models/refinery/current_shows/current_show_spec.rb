require 'spec_helper'

module Refinery
  module CurrentShows
    describe CurrentShow do
      describe "validations" do
        subject do
          FactoryGirl.create(:current_show,
          :caption => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:caption) { should == "Refinery CMS" }
      end
    end
  end
end
