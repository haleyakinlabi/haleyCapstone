# frozen_string_literal: true

module Users
  class AuthenticationController < ApiGuard::AuthenticationController
    # before_action :find_resource, only: [:create]
    # before_action :authenticate_resource, only: [:destroy]

    def create
      respond_to do |format|
        if resource.authenticate(params[:password])
          create_token_and_set_header(resource, resource_name)
          resource.update_columns token_issued_at: Time.current
          @user = resource.reload
          format.json { render "users/show", status: :created, location: @user }
        else
          format.json { render json: {message: I18n.t("api_guard.authentication.invalid_login_credentials")}, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      current_resource&.update_columns token_issued_at: nil
      super
      #   blacklist_token
      #   render_success(message: I18n.t('api_guard.authentication.signed_out'))
    end

    # private

    # def find_resource
    #   self.resource = resource_class.find_by(email: params[:email].downcase.strip) if params[:email].present?
    #   render_error(422, message: I18n.t('api_guard.authentication.invalid_login_credentials')) unless resource
    # end
  end
end
