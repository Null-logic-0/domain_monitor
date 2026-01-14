class BillingController < ApplicationController
  def show
    url = Current.user.payment_processor.billing_portal.url
    raise "Invalid redirect host" unless URI(url).host&.end_with?("stripe.com")

    redirect_to url, allow_other_host: true
  end
end
