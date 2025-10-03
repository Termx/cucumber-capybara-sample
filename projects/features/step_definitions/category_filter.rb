
#########
# GIVEN
#########



#########
# WHEN
#########

When(/^I select the Hammer category from the category filter checkbox$/) do
  @category_filter_page.CategoryFilterPage.new
  @category_filter_page.check_hammer_category
end

When(/^I unselect the Hammer category from the category filter checkbox$/) do
  @category_filter_page.CategoryFilterPage.new
  @category_filter_page.uncheck_hammer_category
end

#########
# THEN
#########

Then(/^I should see products displayed that are under the Hammer category$/) do
  @category_filter_page.CategoryFilterPage.new
  @category_filter_page.verify_hammer_category_count
end