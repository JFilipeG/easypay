require 'rails/generators'
require 'rails/generators/migration'

class EasypayGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template  'migration.rb', 'db/migrate/create_easypay_tables.rb'
  end

  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/easypay.rb'
  end

end
