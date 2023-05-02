# frozen_string_literal: true

class Store::SessionsController < Devise::SessionsController
  before_action :store_state, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #退会処理後、ログインできないように処理
  def store_state
    @store = Store.find_by(email: params[:store][:email])
    return if !@store
    if @store.valid_password?(params[:store][:password]) && @store.is_deleted == true
    flash[:alert] = "店舗削除済みです"
    end
  end

end
