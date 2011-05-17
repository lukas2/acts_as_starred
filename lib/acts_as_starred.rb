require 'active_record'

module ActsAsStarred

  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def acts_as_starred(options={})
      has_many :stars, :as => :starrable, :dependent => :destroy
      extend ActsAsStarred::SingletonMethods
      include ActsAsStarred::InstanceMethods
    end
  end

  module SingletonMethods
    def starred_for(starrable)
      Star.find(:all, :conditions => { :starrable_id => starrable.id, :starrable_type => starrable.class.name })
    end
  end

  module InstanceMethods
    def starred_by
      Star.find(:all, :conditions => { :starrable_id => self.id, :starrable_type => self.class.name }).collect(&:user)
    end

    def star!(user)
      Star.create!( :user => user, :starrable => self )
    end

    def unstar!(user)
      self.stars.find_by_user_id(user.id).delete
    end
  end
end

ActiveRecord::Base.send(:include, ActsAsStarred)
User.send(:has_many, :stars)
