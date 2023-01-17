# frozen_string_literal: true

class UserConnectionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user_connection = current_user.leader_connections.find_or_initialize_by(user_connection_params)

    respond_to do |format|
      if @user_connection.persisted? || @user_connection.save
        @user = current_user.reload
        format.json { render "users/show", status: :created, location: @user }
      else
        format.json { render json: @user_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_connection = current_user.leader_connections.find_by(leader_id: params[:leader_id])
    @user_connection&.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
  end

  private

  def user_connection_params
    params.require(:user_connection).permit(:leader_id)
  end
end
