# -*- encoding : utf-8 -*-
# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_start_session',
  :secret      => '4555cd4a8b772d23c9e2fd4c464154454fadba57b2e5c1508f1a98c3578544883445ae784a4d7e50f582e1469d53679d57e4d781bdfd7d1b9ab7be47f5705583'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
