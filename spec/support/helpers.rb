require 'support/helpers/session_helper'
require 'support/helpers/registration_helper'
require 'support/helpers/wait_for_ajax'

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::RegistrationHelpers, type: :feature
  config.include WaitForAjax, type: :feature
end