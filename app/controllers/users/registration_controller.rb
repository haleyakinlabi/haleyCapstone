# frozen_string_literal: true

module Users
  class RegistrationController < ApiGuard::RegistrationController
    # before_action :authenticate_resource, only: [:destroy]

    def create
      init_resource(sign_up_params)

      respond_to do |format|
        if resource.save
          create_token_and_set_header(resource, resource_name)
          resource.update_columns token_issued_at: Time.current
          @user = resource.reload
          format.json { render "users/show", status: :created, location: @user }
        else
          format.json { render json: resource.errors, status: :unprocessable_entity }
        end
      end

      #   if resource.save
      #     create_token_and_set_header(resource, resource_name)
      #     render_success(message: I18n.t('api_guard.registration.signed_up'))
      #   else
      #     render_error(422, object: resource)
      #   end
    end

    # def destroy
    #   current_resource.destroy
    #   render_success(message: I18n.t('api_guard.registration.account_deleted'))
    # end

    private

    def sign_up_params
      params.permit(:email, :username, :password, :password_confirmation, :species, :breed, :image)
    end
  end
end
