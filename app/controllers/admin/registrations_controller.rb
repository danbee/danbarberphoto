module Admin
  class RegistrationsController < ::Devise::RegistrationsController
    layout 'admin/layouts/login'
  end
end
