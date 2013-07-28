# features/step_definitions/web_steps.rb
require 'cucumber/websteps'

Then(/^I should obtain a (\d+) error$/) do |error_code|
  page.status_code.should == error_code.to_i
end
