class EnrollmentsController < ApplicationController
  before_action :authenticate_user!, :set_course
  
  def create
    if @course.premium?
      # Amount in cents
      @amount = (@course.cost * 100).to_i

      # Stripe
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      
      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )
      
      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Flixter Premium Content',
        currency: 'usd'
      )
    end
    
    current_user.enrollments.create(course: @course)
    redirect_to course_path(@course)
  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to course_path(@course)
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def set_course
    @course ||= Course.find(params[:course_id])
  end
end
