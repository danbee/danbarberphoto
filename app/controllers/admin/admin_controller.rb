class Admin::AdminController < ApplicationController
  layout 'admin/layouts/admin'
  before_filter :authenticate_admin_user!
  before_filter :admin_menu

  force_ssl host: APP_CONFIG[:ssl_hostname]

  def admin_menu
    @admin_menu = { dashboard: '',
                    admin_users: '',
                    categories: '',
                    photos: '',
                    pages: '' }
  end
end
