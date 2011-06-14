class LinksController < ApplicationController

  def index
    @title = "Home"

    @link = current_user.links.new
    @domains = []
    Domain.all.each do |domain|
      @domains << "#{ domain.url }/#{ current_user.name }/"
      @domains << "#{ current_user.name }.#{ domain.url }/"
    end

  end

    def create
#    website_url = params.include?(:website_url) ? params[:website_url] : params[:link][:website_url]
#    @link = Link.find_or_create_by_website_url( website_url )
#    @link.ip_address = request.remote_ip if @link.new_record?

#    if @link.save
#      calculate_links # application controller, refactor soon
#      render :action => :show
#    else
#      flash[:warning] = 'There was an issue trying to create your RubyURL.'
#      redirect_to :action => :invalid
    end


  def generate_token_tiny

  end
end

