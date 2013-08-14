if Rails::VERSION::MAJOR == 2
  class AbingoMigrationGenerator < Rails::Generator::Base
    def manifest
      record do |m|
        m.migration_template 'abingo_migration.rb', 'db/migrate',
          :assigns => {:version => Abingo.MAJOR_VERSION.gsub(".", "")}
      end
    end

    def file_name
      "abingo_migration_#{Abingo.MAJOR_VERSION.gsub(".", "_")}"
    end
  end
else
  require 'rails/generators'
  require 'rails/generators/active_record'
  class Abingo
    class Generators
      class MigrationGenerator < ActiveRecord::Generators::Base
        desc "Generates the migration to add the Abingo tables"

        source_root File.expand_path('../templates', __FILE__)

        def copy_files
          migration_template 'abingo_migration.rb', "db/migrate/abingo_migration.rb"
        end
      end
    end
  end
end
