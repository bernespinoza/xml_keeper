class XmlDocumentsController < ApplicationController
  before_action :set_xml_document, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /xml_documents or /xml_documents.json
  def index
    @xml_documents = XmlDocument.all
  end

  # GET /xml_documents/1 or /xml_documents/1.json
  def show
    respond_to do |format|
      format.xml  { render :show, location: @xml_document }
    end
  end

  # GET /xml_documents/new
  def new
    @xml_document = XmlDocument.new
  end

  # GET /xml_documents/1/edit
  def edit
  end

  # POST /xml_documents or /xml_documents.json
  def create
    file_name = "xml_request_#{XmlDocument.all.size+1}.xml"
    xml_file = Tempfile.new(file_name)
    xml_file.write(Nokogiri::XML(xml_document_params).to_xml)
    xml_file.rewind
    xml_file.close
    @xml_document = XmlDocument.new(name: file_name)
    @xml_document.file.attach(io: xml_file.open, filename: @xml_document.name, content_type: 'application/xml')

    respond_to do |format|
      if @xml_document.save
        xml_file.unlink
        format.html { redirect_to xml_document_url(@xml_document), notice: "Xml document was successfully created." }
        format.json { render :show, status: :created, location: @xml_document }
        format.xml  { render :show, location: @xml_document, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @xml_document.errors, status: :unprocessable_entity }
        format.xml { render json: @xml_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xml_documents/1 or /xml_documents/1.json
  def update
    respond_to do |format|
      if @xml_document.update(xml_document_params)
        format.html { redirect_to xml_document_url(@xml_document), notice: "Xml document was successfully updated." }
        format.json { render :show, status: :ok, location: @xml_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @xml_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xml_documents/1 or /xml_documents/1.json
  def destroy
    @xml_document.destroy

    respond_to do |format|
      format.html { redirect_to xml_documents_url, notice: "Xml document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xml_document
      @xml_document = XmlDocument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def xml_document_params
      params.require(:xmlrequest)#.permit(:name, :s3, :file)
    end
end
