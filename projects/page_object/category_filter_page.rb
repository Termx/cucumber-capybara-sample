class CategoryFilterPage
  include Capybara::DSL

  def check_hammer_category
    check('Hammer')
  end

  def uncheck_hammer_category
    uncheck('Hammer')
  end

  def verify_hammer_category_count
    within('div[data-test="filter_completed"]') do
      expect(page).to have_css('a.card', count: 7)
    end
  end
end