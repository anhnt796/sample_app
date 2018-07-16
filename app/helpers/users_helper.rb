module UsersHelper
  def gravatar_for user, options = {size: Settings.gravatar.user.SIZE}
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase) if user.email
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
