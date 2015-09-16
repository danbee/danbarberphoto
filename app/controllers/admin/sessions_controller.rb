module Admin
  class SessionsController < ::Devise::SessionsController
    layout 'admin/layouts/login'

    before_filter :check_https

    private

    def check_https
      secure_link = url_for(protocol: 'https')
      flash[:alert] = I18n.t('insecure_alert', secure_link: secure_link).html_safe unless request.scheme == 'https'
    end
  end
end
