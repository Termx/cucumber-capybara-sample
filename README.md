# Cucumber Capybara Sample

A behavior-driven test automation framework built with **Ruby**, **Cucumber**, **Capybara**, and **RSpec**, following the **Page Object Model** pattern. This project demonstrates end-to-end UI test coverage for login and password reset functionality against a live web application.

---

## Tech Stack

| Tool | Purpose |
|---|---|
| Ruby 4.0 | Primary language |
| Cucumber | BDD test runner, Gherkin feature files |
| Capybara | Browser interaction and DSL |
| RSpec | Assertions and matchers |
| Selenium WebDriver | Browser automation (Chrome / Firefox) |
| RuboCop | Static analysis and code style enforcement |
| Bundler | Gem dependency management |

---

## Project Structure

```
cucumber-capybara-sample/
├── Gemfile                          # Gem dependencies
├── Gemfile.lock
├── .rubocop.yml                     # RuboCop configuration
└── projects/
    ├── cucumber.yml                 # Cucumber profiles (default, sanity)
    ├── config.yml                   # Environment configuration (base URLs, credentials)
    ├── features/
    │   ├── login.feature            # Gherkin scenarios
    │   ├── step_definitions/
    │   │   └── login.rb             # Step implementations
    │   └── support/
    │       └── env.rb               # Cucumber environment bootstrap
    ├── page_object/
    │   └── login_page.rb            # Page Object for the login page
    ├── support/
    │   └── env.rb                   # Capybara config, driver setup, hooks, helpers
    └── test-reports/                # HTML reports and screenshots (generated)
```

---

## Design Patterns

### Page Object Model
Browser interactions are encapsulated in page object classes (e.g., `LoginPage`), keeping step definitions clean and free of raw Capybara selectors. This makes the suite easier to maintain as the UI evolves — selector changes only need to be updated in one place.

### BDD with Gherkin
Test scenarios are written in plain English using Gherkin syntax, making them readable by both technical and non-technical stakeholders.

### Environment-Driven Configuration
Base URLs and test credentials are stored in `config.yml` and loaded based on the `QA_ENV` environment variable, making it straightforward to target different environments (QA, staging, etc.).

---

## Prerequisites

- **Ruby 4.0+**
- **Bundler** (`gem install bundler`)
- **Google Chrome** (default browser)
- **MSYS2 / MINGW toolchain** (Windows only — required for native gem compilation)

On Windows, install the development toolchain via:
```bash
ridk install
```
Choose option **3** (MSYS2 and MINGW development toolchain) when prompted.

---

## Installation

```bash
# Clone the repository
git clone https://github.com/your-username/cucumber-capybara-sample.git
cd cucumber-capybara-sample

# Install all dependencies
bundle install
```

---

## Running Tests

All commands are run from the **project root** (`cucumber-capybara-sample/`).

```bash
# Run all feature tests with the default profile
cucumber

# Run a specific feature file
cucumber projects/features/login.feature

# Run a specific scenario by line number
cucumber projects/features/login.feature:7

# Run sanity-tagged scenarios only
cucumber -p sanity

# Run against a different environment (defaults to 'qa')
QA_ENV=staging cucumber

# Run with a specific browser (defaults to Chrome)
BROWSER=firefox cucumber
```
---

## Cucumber Profiles

Profiles are defined in `projects/cucumber.yml`:

| Profile | Description |
|---|---|
| `default` | Runs all non-`@wip` scenarios with pretty output and HTML report |
| `sanity` | Runs scenarios tagged with `@sanity` only |

---

## Reporting

HTML reports are generated automatically on each run and saved to:
```
projects/test-reports/cucumber-report.html
```

On failure, a screenshot is automatically captured and embedded in the HTML report.

---

## Code Quality

RuboCop is configured via `.rubocop.yml` with `rubocop-rspec` and `rubocop-performance` plugins. To run a lint check:

```bash
bundle exec rubocop
```
