module ApplicationHelper
  def add_pool_class
    if current_page?(pool_index_path)
      return 'pool-page'
    end
  end
end
