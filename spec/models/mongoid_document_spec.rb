require 'spec_helper'

describe MongoidDocument do

  it "should not overwrite existing fields of an embedded document if those fields are omitted from the update params" do
    doc = MongoidDocument.new({:images => [{:name => "foo"}]})
    doc.save!
    doc.images[0].name.should == "foo"
    doc.update_attributes({:images => [
        {:id => doc.images[0].id,
         :another_field => "other field"}
      ]})
    doc.images.count.should == 1
    doc.images[0].another_field.should == "other field"
    doc.images[0].name.should == "foo"
  end 

end
