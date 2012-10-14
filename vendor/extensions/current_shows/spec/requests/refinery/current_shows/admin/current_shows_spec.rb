# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CurrentShows" do
    describe "Admin" do
      describe "current_shows" do
        login_refinery_user

        describe "current_shows list" do
          before do
            FactoryGirl.create(:current_show, :caption => "UniqueTitleOne")
            FactoryGirl.create(:current_show, :caption => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.current_shows_admin_current_shows_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.current_shows_admin_current_shows_path

            click_link "Add New Current Show"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Caption", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CurrentShows::CurrentShow.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Caption can't be blank")
              Refinery::CurrentShows::CurrentShow.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:current_show, :caption => "UniqueTitle") }

            it "should fail" do
              visit refinery.current_shows_admin_current_shows_path

              click_link "Add New Current Show"

              fill_in "Caption", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CurrentShows::CurrentShow.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:current_show, :caption => "A caption") }

          it "should succeed" do
            visit refinery.current_shows_admin_current_shows_path

            within ".actions" do
              click_link "Edit this current show"
            end

            fill_in "Caption", :with => "A different caption"
            click_button "Save"

            page.should have_content("'A different caption' was successfully updated.")
            page.should have_no_content("A caption")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:current_show, :caption => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.current_shows_admin_current_shows_path

            click_link "Remove this current show forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CurrentShows::CurrentShow.count.should == 0
          end
        end

      end
    end
  end
end
