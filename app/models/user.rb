class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :advertisements       

  validates :firstname,  presence: true, length: { maximum: 100 }    
  validates :lastname,  presence: true, length: { maximum: 100 }

  # instead of deleting, indicate the user requested a delete & timestamp it  
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end 
  
  # ensure user account is active  
  def active_for_authentication?  
    super && !deleted_at  
  end  

  # provide a custom message for a deleted account   
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end
end
