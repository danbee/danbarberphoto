module Admin
  class PasswordsController < ::Devise::PasswordsController
    layout 'admin/layouts/login'
  end
end
