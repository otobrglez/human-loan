class User < ActiveRecord::Base
  include Clearance::User
  has_many :inquiries

  def public_name
    if first_name.present?
      return first_name
    else
      email[0, email.index('@')+2]+".."
    end
  end

  def gravatar
    hash = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
