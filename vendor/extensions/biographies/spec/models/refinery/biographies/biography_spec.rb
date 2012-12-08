require 'spec_helper'

module Refinery
  module Biographies
    describe Biography do
      describe "validations" do
        subject do
          FactoryGirl.create(:biography)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
