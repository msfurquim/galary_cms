require 'spec_helper'

module Refinery
  module Exhibitions
    describe Exhibition do
      describe "validations" do
        subject do
          FactoryGirl.create(:exhibition)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
