require 'rails/generators'
require 'rails/generators/migration'     

class StarredGenerator < Rails::Generators::Base

  include Rails::Generators::Migration

  def self.source_root
    File.expand_path('../templates', __FILE__)
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime('%Y%m%d%H%M%S')
    else
      '%.3d' % (current_migration_number(dirname) + 1)
    end
  end

  def create_model_file
    migration_template 'create_stars.rb', 'db/migrate/create_stars.rb'
    template 'star.rb', 'app/models/star.rb'
  end
end

