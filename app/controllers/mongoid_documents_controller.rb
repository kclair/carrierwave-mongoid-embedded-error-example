class MongoidDocumentsController < ApplicationController

  def create
    @doc = MongoidDocument.new(params[:mongoid_document])
    @doc.save!
  end

  def update
    @doc = MongoidDocument.find(params[:id])
    @doc.update_attributes(params[:mongoid_document])
    @doc.save!
  end

end
