class ListopiaGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_controllers
    if gen_name == 'install'
      cp_setup
      cp_controllers
      cp_models
    elsif gen_name == 'controllers'
      cp_controllers
    elsif gem_name = 'models'
      cp_models
    else
      puts 'Listopia Generator - wrong Name'
      puts 'Try to use [install|controllers]'
    end
  end

  private

  def gen_name
    name.to_s.downcase
  end
  
  def cp_models
    copy_file 'list.rb', 'app/models/list.rb'
    copy_file 'list_item.rb', 'app/models/list_item.rb'    
  end

  def cp_setup
    copy_file 'listopia.rb', 'config/initializers/listopia.rb'
  end

  def cp_controllers
    copy_file 'lists_controller.rb',               'app/controllers/lists_controller.rb'
    copy_file 'list_items_controller.rb',          'app/controllers/list_items_controller.rb'
  end
end