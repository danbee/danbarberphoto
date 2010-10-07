# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photos_session',
  :secret      => 'ed6e47eac508a8c65c3c07ed65c888777d4282f081da72cfdd2b19cf8ff553a655b3fc44e6a92c85c396444359539934e1f1c2ea1558dcd0fafc80699cfc5694'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
