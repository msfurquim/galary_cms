# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Catalogues" do
    describe "Admin" do
      describe "catalogues" do
        login_refinery_user

        describe "catalogues list" do
          before do
            FactoryGirl.create(:catalogue, :author => "UniqueTitleOne")
            FactoryGirl.create(:catalogue, :author => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.catalogues_admin_catalogues_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.catalogues_admin_catalogues_path

            click_link "Add New Catalogue"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Author", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Catalogues::Catalogue.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Author can't be blank")
              Refinery::Catalogues::Catalogue.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:catalogue, :author => "UniqueTitle") }

            it "should fail" do
              visit refinery.catalogues_admin_catalogues_path

              click_link "Add New Catalogue"

              fill_in "Author", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Catalogues::Catalogue.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:catalogue, :author => "A author") }

          it "should succeed" do
            visit refinery.catalogues_admin_catalogues_path

            within ".actions" do
              click_link "Edit this catalogue"
            end

            fill_in "Author", :with => "A different author"
            click_button "Save"

            page.should have_content("'A different author' was successfully updated.")
            page.should have_no_content("A author")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:catalogue, :author => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.catalogues_admin_catalogues_path

            click_link "Remove this catalogue forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Catalogues::Catalogue.count.should == 0
          end
        end

      end
    end
  end
end
