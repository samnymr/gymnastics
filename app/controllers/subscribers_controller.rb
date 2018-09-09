class SubscribersController < ApplicationController

  def create
      @subscriber = Subscriber.new subscriber_params
      exist = Subscriber.where(email: params[:subscriber][:email])
      if exist.present?
        redirect_to root_path, alert: "Already Subscribed"
      else
        if @subscriber.save
            redirect_to root_path, notice: "Subscribed to our mailing list"
        else
            redirect_to root_path, alert: "Failed to save"
        end
      end
  end

  private

  def subscriber_params
      params.require(:subscriber).permit(:name, :email, :source, :gdpr)
  end

end
