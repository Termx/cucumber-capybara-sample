
#########
# GIVEN
#########

Given(/^I navigate to the Home page$/) do
  @search_page = SearchPage.new
  @search_page.load_home_page
end

#########
# WHEN
#########

When(/^I enter a valid product name in the search bar$/) do
  @search_page = SearchPage.new
  @search_page.thor_search
end

When(/^I click the X button to clear the search results$/) do
  @search_page = SearchPage.new
  @search_page.x_button
end

#########
# THEN
#########

Then(/^I should see the Thor search results display$/) do
  @search_page = SearchPage.new
  @search_page.thor_search_results
end

Then(/^I should see store list restore to default state$/) do
  @search_page = SearchPage.new
  @search_page.search_restore_state
end