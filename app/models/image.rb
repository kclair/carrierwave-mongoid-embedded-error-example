class Image
  include Mongoid::Document
  include Mongoid::Versioning

  embedded_in :mongoid_doc

  field :name
  field :another_field
  mount_uploader :image_file, ImageUploader

end
