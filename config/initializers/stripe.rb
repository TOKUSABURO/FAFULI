Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xROgwEFOepP8jL1QyEAsWuoM00m0Fdcv1I',
  :secret_key => 'sk_test_yhIenBS4VMws7vTD3aNC1PHs00opIeowVX'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]