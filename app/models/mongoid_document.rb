class MongoidDocument
  include Mongoid::Document
  include Mongoid::Versioning

  embeds_many :images, :cascade_callbacks => true
  accepts_nested_attributes_for :images, :allow_destroy => true

#  def update_attributes(params)
#    self.embedded_images = params[:images]
#    new_params = params.delete_if{|k,v| k == "images"}
#    super(new_params)
#  end
#
#  def embedded_images=(images)
#    images.each do |i_params|
#      if i_params["id"] && !i_params["id"].blank?
#        image = self.images.find(i_params["id"])
#        image.update_attributes(i_params)
#      else
#        image = Image.create(i_params)
#        # i know, why would anyone call update_attributes after create with the same atts?
#        # but if they did, and i_params happened to have a blank "id" key,
#        # it will throw an error trying to find a Mongoid::Document with a nil id
#        image.update_attributes(i_params)
#        self.images << image
#      end
#    end
#  end
end
