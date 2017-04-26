Paperclip.interpolates :gravatar do |model, style|
  hash = Digest::MD5.hexdigest(model.instance.email)
  "http://www.gravatar.com/avatar/#{hash}"
end