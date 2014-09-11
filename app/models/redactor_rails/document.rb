class RedactorRails::Document < RedactorRails::Asset #FIXME what?
  mount_uploader :data, RedactorRailsDocumentUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end

  def as_json_methods
    [:image]
  end
end
