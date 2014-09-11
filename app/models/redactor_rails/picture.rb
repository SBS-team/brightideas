class RedactorRails::Picture < RedactorRails::Asset #FIXME what?
  mount_uploader :data, RedactorRailsPictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
