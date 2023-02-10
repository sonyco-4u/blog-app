require "rails_helper"
RSpec.describe "user", type: :feature do
    it 'shows the username' do
        man = User.create(name: "done",
            posts_counter:0


        )
        visit root_path
        expect(page).to have_content('done')
      end
  end