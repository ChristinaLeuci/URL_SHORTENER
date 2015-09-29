class Url < ActiveRecord::Base
  # each of these must be present
  validates :long_url, :short_url, :http_status, :presence => true
  # the long_url must be unique, don't want multiples
  validates :long_url, :uniqueness => true
  
  # generate the short url
  def generate_short
    # the short_url is equal to the id to base 36
    # even if it gets insanely large the short_url will still equal no more than six or seven letters
    self.short_url = self.id.to_s(36)
    self.save
  end
end
