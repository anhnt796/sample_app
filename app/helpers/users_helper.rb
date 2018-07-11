module UsersHelper
  def gravatar_for user
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase) if user.email
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
