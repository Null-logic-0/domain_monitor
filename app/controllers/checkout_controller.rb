class CheckoutController < ApplicationController
  def show
    checkout_session = Current.user.payment_processor.checkout(
      mode: :subscription,
      line_items: "price_1SpSmrEsKITBjZGTLhRRGM1U",
      success_url: checkout_return_url,
      allow_promotion_codes: true,
    )
    redirect_to safe_stripe_url!(checkout_session.url), allow_other_host: true
  end

  private

  def safe_stripe_url!(url)
    uri = URI.parse(url)

    unless uri.is_a?(URI::HTTPS) && uri.host&.end_with?("stripe.com")
      raise ActionController::Redirecting::UnsafeRedirectError,
            "Blocked non-Stripe redirect: #{url}"
    end

    url
  end
end
