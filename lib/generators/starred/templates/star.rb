class Star < ActiveRecord::Base

  belongs_to :starrable, :polymorphic => true
  belongs_to :user

end
