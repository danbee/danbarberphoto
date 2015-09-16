module Admin
  class AdminUsersController < Admin::AdminController
    def index
      @admin_users = AdminUser.all
    end

    def new
      @admin_user = AdminUser.new
    end

    def edit
      @admin_user = AdminUser.find(params[:id])
    end

    def update
      @admin_user = AdminUser.find(params[:id])

      if @admin_user.update_attributes(permitted_params)
        redirect_to admin_admin_users_path, notice: 'Admin User was successfully updated.'
      else
        render :edit
      end
    end

    def create
      @admin_user = AdminUser.new(permitted_params)

      if @admin_user.save
        redirect_to admin_admin_users_path, notice: 'Admin User was successfully added.'
      else
        render :edit
      end
    end

    def destroy
      @admin_user = AdminUser.find(params[:id])
      @admin_user.destroy

      redirect_to admin_admin_users_path, notice: 'Admin User was deleted.'
    end

    # Allow the current logged in user to change their password
    def edit_password
      @admin_user = current_admin_user
    end

    def update_password
      @admin_user = current_admin_user

      if @admin_user.update_with_password(permitted_params)
        sign_in @admin_user, bypass: true
        redirect_to admin_dashboard_path, notice: 'Password updated!'
      else
        render :edit_password
      end
    end

    private

    def permitted_params
      params.require(:admin_user).permit(:email, :password, :password_confirmable, :remember_me)
    end
  end
end
