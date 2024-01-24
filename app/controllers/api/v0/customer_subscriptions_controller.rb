class Api::V0::CustomerSubscriptionsController < ApplicationController
  # def create
  #   customer_subscription = CustomerSubscription.create!(customer_subscription_params)
  #   render json: CustomerSubscriptionSerializer.new(customer_subscription), status: :created
  # end

  def create
    # begin
    #   customer_subscription = CustomerSubscription.create!(customer_subscription_params)
    #   render json: CustomerSubscriptionSerializer.new(customer_subscription), status: :created
    # rescue ActiveRecord::RecordInvalid => exception
    #   handle_create_error(exception)
    # end

    begin
      customer_subscription = CustomerSubscription.create!(customer_subscription_params)
      render json: CustomerSubscriptionSerializer.new(customer_subscription), status: 201
    rescue ActiveRecord::RecordInvalid => exception
      customer_id = exception.record.customer_id
      subscription_id = exception.record.subscription_id
      if CustomerSubscription.find_by(customer_id: customer_id, subscription_id: subscription_id).present?
        duplicate_id_error_response(customer_id, subscription_id)
      elsif customer_id.nil? || subscription_id.nil?
        validation_error_response(exception)
      elsif customer_id != nil && subscription_id != nil
        not_found_response(exception)
      end
    end
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id)
  end

  def not_found_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404))
      .serialize_json, status: :not_found
  end

  def validation_error_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400))
      .serialize_json, status: :bad_request
  end

  def duplicate_id_error_response(customer_id, subscription_id)
    render json: ErrorSerializer.new(ErrorMessage.new("Validation failed: Customer subscription association between customer and subscription with customer_id=#{customer_id} and subscription_id=#{subscription_id} already exists", 422))
    .serialize_json, status: :unprocessable_entity
  end

end
