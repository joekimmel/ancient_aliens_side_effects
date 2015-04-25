class Foonit < ActiveRecord::Base
  belongs_to :fooperty, autosave: true

  validate :complex_biz_logic_for_name

  def complex_biz_logic_for_name
    ## the test fails if this line is uncommented, but passes if it is commented -- somebody's keeping a cache!!!
    self.fooperty.foonits.select(&:created_at)

    #with line 9 uncommented, we can try some things to fix it::::



    #does make the test pass:
    # self.fooperty.reload
    #   # or
    # self.fooperty.clear_association_cache
    #    or 
    # self.fooperty.foonits.reset

    #doesn't make the test pass:
    # ActiveRecord::Base.connection.clear_query_cache
    #   or
    # self.clear_association_cache
    #    or
    # Fooperty.connection.clear_query_cache
    #    or
    # [Fooperty|Foonit].uncached do self.fooperty.foonits.select(&:created_at) end

    true
  end

end
