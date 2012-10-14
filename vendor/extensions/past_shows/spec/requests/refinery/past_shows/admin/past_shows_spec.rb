# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PastShows" do
    describe "Admin" do
      describe "past_shows" do
        login_refinery_user

        describe "past_shows list" do
          before do
            FactoryGirl.create(:past_show, :year => "UniqueTitleOne")
            FactoryGirl.create(:past_show, :year => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.past_shows_admin_past_shows_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.past_shows_admin_past_shows_path

            click_link "Add New Past Show"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Year", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PastShows::PastShow.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Year can't be blank")
              Refinery::PastShows::PastShow.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:past_show, :year => "UniqueTitle") }

            it "should fail" do
              visit refinery.past_shows_admin_past_shows_path

              click_link "Add New Past Show"

              fill_in "Year", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PastShows::PastShow.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:past_show, :year => "A year") }

          it "should succeed" do
            visit refinery.past_shows_admin_past_shows_path

            within ".actions" do
              click_link "Edit this past show"
            end

            fill_in "Year", :with => "A different year"
            click_button "Save"

            page.should have_content("'A different year' was successfully updated.")
            page.should have_no_content("A year")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:past_show, :year => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.past_shows_admin_past_shows_path

            click_link "Remove this past show forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PastShows::PastShow.count.should == 0
          end
        end

      end
    end
  end
end
