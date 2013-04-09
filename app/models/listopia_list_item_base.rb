module ListopiaListItemBase
  extend ActiveSupport::Concern

  included do
    attr_accessible :list_id, :position, :resource_id, :resource_type, :list, :resource, :bag
    belongs_to :list, :counter_cache => :items_count
    belongs_to :resource, :polymorphic => true, :counter_cache => :list_count
    
    scope :resource, lambda{ |r| where(:resource_id => r.id, :resource_type => r.class.name) }      
  end
  
  def name
    resource.name
  end
  private
end

