class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  belongs_to :player

  def self.from_omniauth(auth)
    ap auth
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name unless auth.info.name.blank?
      user.image = auth.info.image unless auth.info.image.blank?
      user.email = auth.info.email unless auth.info.email.blank?
      #user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  provider:auth.provider,
                           uid:auth.uid,
                           name:auth.info.name,
                           email:auth.info.email,
                           image:auth.info.image,
                           password:Devise.friendly_token[0,20]
      )

      if user.email.nil?
        user.email = "#{user.name.parameterize}@facebookuser.com"
      end
      #user.ensure_authentication_token!
      # added extra to create authentication token for user

      user.save(validate: false)
    end
    user
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
