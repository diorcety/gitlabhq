class Spinach::Features::DashboardGroup < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedGroup
  include SharedPaths
  include SharedUser

  # Leave

  step 'I click on the "Leave" button for group "Owned"' do
    find(:css, 'li', text: "Owner").find(:css, 'i.fa.fa-sign-out').click
    # poltergeist always confirms popups.
  end

  step 'I click on the "Leave" button for group "Guest"' do
    find(:css, 'li', text: "Guest").find(:css, 'i.fa.fa-sign-out').click
    # poltergeist always confirms popups.
  end

  step 'I should not see the "Leave" button for group "Owned"' do
    find(:css, 'li', text: "Owner").should_not have_selector(:css, 'i.fa.fa-sign-out')
    # poltergeist always confirms popups.
  end

  step 'I should not see the "Leave" button for groupr "Guest"' do
    find(:css, 'li', text: "Guest").should_not have_selector(:css,  'i.fa.fa-sign-out')
    # poltergeist always confirms popups.
  end

  step 'I should see group "Owned" in group list' do
    page.should have_content("Owned")
  end

  step 'I should not see group "Owned" in group list' do
    page.should_not have_content("Owned")
  end

  step 'I should see group "Guest" in group list' do
    page.should have_content("Guest")
  end

  step 'I should not see group "Guest" in group list' do
    page.should_not have_content("Guest")
  end

  step 'I click new group link' do
    click_link "New Group"
  end

  step 'submit form with new group "Samurai" info' do
    fill_in 'group_path', with: 'Samurai'
    fill_in 'group_description', with: 'Tokugawa Shogunate'
    click_button "Create group"
  end

  step 'I should be redirected to group "Samurai" page' do
    current_path.should == group_path(Group.find_by(name: 'Samurai'))
  end

  step 'I should see newly created group "Samurai"' do
    page.should have_content "Samurai"
    page.should have_content "Tokugawa Shogunate"
  end
end
