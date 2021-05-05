class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
    description: 'test',
    card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )
    if card.save
      redirect_to root_path
    else
      redirect_to action: "new"
    end
  end

  def plan
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp::Plan.create(
      amount: 50,
      interval: 'month',
      billing_day: 27,
      currency: 'jpy'
    )
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.create(
      customer: card.customer_token,
      plan: plan,
      metadata: {user_id: current_user.id}
    )
    current_user.update(subscription_id: subscription.id, premium: true)
    redirect_to root_path
  end

  def cancel
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
    subscription.cancel
    current_user.update(premium: false)
    redirect_to root_path
    end
  # def plan
  #   redirect_to new_card_path and return unless current_user.card.present?

  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   customer_token = current_user.card.customer_token
  #   Payjp::Charge.create(
  #     amount: 300,
  #     customer: customer_token,
  #     currency: 'jpy'
  #   )
  #   redirect_to root_path
  # end


end
