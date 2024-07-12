# Pin npm packages by running ./bin/importmap

pin "application"
pin "bootstrap" # @5.3.3
pin "popper", to: 'popper.js', preload: true
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.4
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.4
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.1.3
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
