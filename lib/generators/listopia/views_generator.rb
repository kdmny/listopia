module Listopia
  module Generators
    class ViewsGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../../../../app/views', __FILE__)

      def self.banner
<<-BANNER.chomp

bundle exec rails g listopia:views assets
bundle exec rails g listopia:views views
bundle exec rails g listopia:views helper

BANNER
      end

      def copy_sortable_tree_files
        copy_gem_files
      end

      private

      def param_name
        name.downcase
      end

      def copy_gem_files
        if param_name == 'assets'
          copy_file "../assets/javascripts/listopia", "app/assets/javascripts/listopia"
          copy_file "../assets/stylesheets/listopia", "app/assets/stylesheets/listopia"
        elsif param_name == 'views'
          directory "../views/listopia",           "app/views/listopia"
        elsif param_name == 'helper'
          copy_file "../helpers/listopia_helper.rb", "app/helpers/listopia_helper.rb"
        else
          puts "Wrong params - use only [assets | views | helper] values"
        end
      end

    end
  end
end