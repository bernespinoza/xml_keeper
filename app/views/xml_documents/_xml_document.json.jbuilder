json.extract! xml_document, :id, :name, :s3, :created_at, :updated_at
json.url xml_document_url(xml_document, format: :json)
