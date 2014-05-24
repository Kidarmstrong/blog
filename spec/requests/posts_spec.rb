require 'spec_helper'

describe "Posts" do

    subject { page }

    describe "new post page" do
      before { visit new_post_path }

      it { should have_content('New Post') }
    end

    describe "new post" do

      before { visit new_post_path }

      let(:submit) { "Create Post" }

      describe "with invalid information" do
        it "should not create a user" do
          expect { click_button submit }.not_to change(Posts, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Subject",      with: "Heading"
          fill_in "Main Body",    with: "THIS IS SOME TEXT"
        end

        it "should create a post" do
          expect { click_button submit }.to change(Posts, :count).by(1)
        end
      end
    end
  end
end
