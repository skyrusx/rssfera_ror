# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/scripts", under: "scripts"
pin "jquery" # @3.7.1
pin "inputmask" # @5.0.9
pin "select2" # @4.1.0
pin "bootstrap", to: "bootstrap.bundle.min.js", preload: true
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "jquery.inputmask", to: "jquery.inputmask.min.js", preload: true # @3.3.4
pin "select2", to: "select2.min.js", preload: true # @3.3.4
pin "ckeditor" # @4.12.1
