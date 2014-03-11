module UsersHelper
  # Returns the gravatar (http://gravatar.com) for the given user.
  def gravatar_for(user, options = {size: 50})
    # Creates a MD5 hash from you email
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

    size = options[:size]

    # A URL created from your gravatar_id
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
    # The  image tag  from your gravatar URL
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
