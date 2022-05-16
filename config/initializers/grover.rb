# frozen_string_literal:true

Grover.configure do |config|
  config.options = {
    format: 'A4',
    print_background: true,
    timezone: 'Australia/Sydney',
    wait_for_function: 'document.fonts.ready'
  }
end
