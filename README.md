This project uses Ruby, Bundler, Cucumber, Capybara, and RSpec for behavior-driven tests with a page-object style.

Prerequisites:
- Ruby (3.0+ recommended)
- Bundler

Install dependencies:
```bash
# Install Bundler if you don’t have it already
gem install bundler

# Install all project dependencies from the Gemfile
bundle install
```
Bundler will install Cucumber, Capybara, RSpec, and any other gems defined in the Gemfile.

Running Tests:

You can run your feature tests using Cucumber:
```bash
# Runs all feature tests
bundle exec cucumber features/

# Runs a specific feature file
bundle exec cucumber features/<name>.feature

# Runs a specific scenario at a given line number
bundle exec cucumber features/<name>.feature:<line>
```
Using bundle exec ensures the tests use the same gem versions defined for the project.

Notes:

Capybara is a Ruby library that simulates how real users interact with your web app (clicking links, filling in forms, etc.). It supports multiple drivers such as Selenium by default, and lets you switch between headless and headed runs as needed.

Cucumber reads .feature files written in Gherkin and connects them to Ruby step definitions — this is the BDD flow that drives your acceptance tests.