module ListopiaListBase
  extend ActiveSupport::Concern

  included do
    attr_accessible :bag, :description, :items_count, :name, :slug, :type, :user_id, :user
    has_many :list_items, :dependent => :destroy, :order => 'position'
    belongs_to :user
    validates_presence_of :name
  end
  def remove(thing)
    ListItem.transaction do
      self.list_items.where(["resource_id = ? and resource_type = ?", thing.id, thing.class.name]).each(&:destroy)
    end
  end
  
  def contains?(thing)
    ListItem.where(["list_id = ?", self.id]).
      where(:resource_id => thing.id, :resource_type => thing.class.name).any?
  end

  def add(thing)
    self.list_items << ListItem.new(:resource => thing) unless contains?(thing)
    true
  end
  private
end

