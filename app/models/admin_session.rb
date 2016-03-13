class AdminSession < ActiveRecord::Base
  belongs_to :admin
  validates :token_key, presence: true, uniqueness: true

  class << self
    def authorized?(token, username)
      key = self.create_token_key(token, name)
      admin_session = AdminSession.find_by(token_key: key, status: "active")
      admin_session.present?
    end

    def logout(token, username)
      key = self.create_token_key(token, name)
      admin_session = AdminSession.find_by(token_key: key, status: "active")
      admin_session.update_attributes(status: "inactive")
    end

    def create_token_key(token, username)
      secret = token.encode("ASCII")
      digest = OpenSSL::Digest.new("sha1")
      message = name.encode("ASCII")
      hmac = OpenSSL::HMAC.digest(digest, secret, message)
      key = Base64.strict_encode64(hmac)
      key
    end
  end
end
