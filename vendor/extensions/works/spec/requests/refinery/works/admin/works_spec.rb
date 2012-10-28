# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Works" do
    describe "Admin" do
      describe "works" do
        login_refinery_user

        describe "works list" do
          before do
            FactoryGirl.create(:work, :caption => "UniqueTitleOne")
            FactoryGirl.create(:work, :caption => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.works_admin_works_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.works_admin_works_path

            click_link "Add New Work"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Caption", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Works::Work.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Caption can't be blank")
              Refinery::Works::Work.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:work, :caption => "UniqueTitle") }

            it "should fail" do
              visit refinery.works_admin_works_path

              click_link "Add New Work"

              fill_in "Caption", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Works::Work.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:work, :caption => "A caption") }

          it "should succeed" do
            visit refinery.works_admin_works_path

            within ".actions" do
              click_link "Edit this work"
            end

            fill_in "Caption", :with => "A different caption"
            click_button "Save"

            page.should have_content("'A different caption' was successfully updated.")
            page.should have_no_content("A caption")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:work, :caption => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.works_admin_works_path

            click_link "Remove this work forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Works::Work.count.should == 0
          end
        end

      end
    end
  end
end
