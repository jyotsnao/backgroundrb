module Rails
  module Generators
    module Migration
      attr_reader :migration_number, :migration_file_name, :migration_class_name

      def migration_template(source, destination=nil, config={})
        puts "1111111111111111111111111111111"
        puts "#{source} || #{destination} || #{self.class}"
#        destination = File.expand_path(destination || source, self.destination_root)
#
#        migration_dir = File.dirname(destination)
        migration_dir = File.dirname(destination)
        @migration_number     = self.class.next_migration_number(migration_dir)
        @migration_file_name  = File.basename(destination).sub(/\.rb$/, '')
        @migration_class_name = @migration_file_name.camelize

        destination = self.class.migration_exists?(migration_dir, @migration_file_name)

        if behavior == :invoke
          raise Error, "Another migration is already named #{@migration_file_name}: #{destination}" if destination
          destination = File.join(migration_dir, "#{@migration_number}_#{@migration_file_name}.rb")
        end

        template(source, destination, config)
      end
    end
  end
end