class ChargesController < ApplicationController
    def new
end
def create
 course= Course.find(params[:course_id])
  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
})
charge = Stripe::Charge.create({
  customer: customer.id,
  amount: params[:amount],
  description: params[:info_details],
  currency: 'usd',
})

  purchase= Purchase.create(email: current_user.email,card: params[:stripeToken],
  ammount: course.price,description: course.info_title,currency: "usd",
  user_id: customer.id,course_id: course.id, uuid: SecureRandom.uuid)
  purchase.save
 
  redirect_to purchase

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
