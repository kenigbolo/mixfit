# Api V1 UsersController
module Api
  module V1
    # UsersController
    class UsersController < Api::V1::BaseController
      def create
        @user = User.find_by(username: user_params[:username])
        if @user.present?
          render json: @user, status: :ok
        else
          create_user
        end
      end

      def update
        set_user
        return update_user if @user.present?
        render json: { message: 'No user matching id ' + params[:id] }
      end

      private

      def user_params
        params.require(:user)
              .permit(:username, :weight, :height).reject { |_, v| v.nil? }
      end

      def set_user
        @user = User.find_by(id: params['id'])
      end

      def user_params_filtered
        params = user_params
        params['weight'] = 0.00 if params['weight'].nil?
        params['height'] = 0.00 if params['height'].nil?
        params
      end

      def create_user
        @user = User.new(user_params_filtered)
        if @user.save
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update_user
        if @user.update_attributes(user_params)
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
