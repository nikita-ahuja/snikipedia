Rails.configuration.stripe = {
  :publishable_key => ENV["STRIPE_PUBLISHABLE_KEY"],
  :secret_key => ENV["STRIPE_SECRET_KEY"]
}

p "HELLO"
p ENV
p ENV["STRIPE_PUBLISHABLE_KEY"]
p Rails.configuration.stripe[:secret_key]


Stripe.api_key = Rails.configuration.stripe[:secret_key]