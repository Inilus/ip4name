class Link < ActiveRecord::Base

  has_many :tags

  belongs_to :user
  belongs_to :domain

  validates :url, :presence => true, :uniqueness => true
  validates :token, :uniqueness => true

  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]/ix, :message => 'needs to have http(s):// in front of it', :if => Proc.new { |p| p.url? }
  validate :not_in_surbl, :if => Proc.new { |p| p.url? && p.errors[:url].blank? }

  attr_accessor :statistic

  attr_accessible :url, :token


  private

    def not_in_surbl
      begin
        url = Domainatrix.parse(self.website_url)
        dig_response = %x[/usr/bin/dig +short #{url.domain}.#{url.public_suffix}.multi.surbl.org]
        Rails.logger.warn("DEBUG: #{dig_response.inspect}")
        errors.add_to_base("SPAM. Domain was found in surbl.") if dig_response =~ /127.0/i
      rescue
      end
    end
end

