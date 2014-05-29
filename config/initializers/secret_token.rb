# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

TwitterClone::Application.config.secret_token = secure_token
# TwitterClone::Application.config.secret_token = '04bf6ccbb9920afdd6794c036db7a99b3c64d7f1ecdd17904e62619880c264fb74706937ed1adbf7e6ed6bf23a1a03d6f51c07d7afae6268fa7b5e2b3899b30f'
