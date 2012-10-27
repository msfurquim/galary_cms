# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Artists" do
    describe "Admin" do
      describe "artists" do
        login_refinery_user

        describe "artists list" do
          before do
            FactoryGirl.create(:artist, :name => "UniqueTitleOne")
            FactoryGirl.create(:artist, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.artists_admin_artists_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.artists_admin_artists_path

            click_link "Add New Artist"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Artists::Artist.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Artists::Artist.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:artist, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.artists_admin_artists_path

              click_link "Add New Artist"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Artists::Artist.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:artist, :name => "A name") }

          it "should succeed" do
            visit refinery.artists_admin_artists_path

            within ".actions" do
              click_link "Edit this artist"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:artist, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.artists_admin_artists_path

            click_link "Remove this artist forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Artists::Artist.count.should == 0
          end
        end

      end
    end
  end
end
