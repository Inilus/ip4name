class PagesController < ApplicationController
  def home
    @title = "Home"
    @domains = [ [ "ip4name.com/anonym/", "type1" ], [ "anonym.ip4name.com/", "type2" ] ]
  end

  def about
  end

  def rules
  end

  def license
  end

end

