class SearchPage
  include Capybara::DSL
  include RSpec::Matchers

  def load_home_page
    visit domain
  end

  def thor_search
    fill_in 'search-query', with: 'Thor'
    click_button 'Search'
  end

  def x_button
    click_button 'X'
  end

  def thor_search_results
    expect(page).to have_css('h5.card-title', text: 'Thor Hammer')
    expect(page).to have_xpath('/html/body/app-root/div/app-overview/div[3]/div[2]/div[1]/a/div[3]/span/span', text: '$11.14')
  end

  def search_restore_state
    within('div[data-test="search_completed"]') do
      expect(page).to have_css('a.card', count: 9)
    end
  end
end