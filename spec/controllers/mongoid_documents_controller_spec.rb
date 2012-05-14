require "spec_helper"

describe MongoidDocumentsController do

  it "can create a mongoid document with an embedded image" do
    image_file_path = File.join(Rails.root, 'spec','fixtures','files','foo.txt')
    post :create, :mongoid_document => {
           :images => [
             :name => 'foo',
             :image_file => fixture_file_upload(image_file_path)
           ]
         }
    response.should be_success 
  end

  it "can add a new image to an existing document with an embedded image" do
    image_file_path = File.join(Rails.root, 'spec','fixtures','files','foo.txt')
    doc = MongoidDocument.new({:images => [
             :name => 'foo',
             :image_file => fixture_file_upload(image_file_path),
           ]})
    doc.save! && doc.reload
    post :update, :id => doc.id, :mongoid_document => {
                  :images => [{
                    :id => doc.images[0]._id,
                    :name => 'foo3'
                    },{
                    :id => '',
                    :name => 'foo2',
                    :image_file => fixture_file_upload(image_file_path)
         }]}
    response.should be_success
  end

end
