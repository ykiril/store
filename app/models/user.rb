class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :orders
  has_many :reviews
  
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address
  
  validates :email, presence: true
  
  def billing_address
    super || Address.new
  end

  def shipping_address
    super || Address.new
  end
  
  def self.from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid.to_s)
    return user if user
    
    email = auth.info[:email]
    user = find_by(email: email)
    
    if user
      user.update_attributes(provider: auth.provider, uid: auth.uid.to_s)
    else
      user = create(email: email, provider: auth.provider, uid: auth.uid.to_s)
    end
  end
  
  def password_required?
    super && provider.blank?
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
end
