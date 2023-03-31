require "test_helper"

class XmlDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xml_document = xml_documents(:one)
  end

  test "should get index" do
    get xml_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_xml_document_url
    assert_response :success
  end

  test "should create xml_document" do
    assert_difference("XmlDocument.count") do
      post xml_documents_url, params: { xml_document: { name: @xml_document.name, s3: @xml_document.s3 } }
    end

    assert_redirected_to xml_document_url(XmlDocument.last)
  end

  test "should show xml_document" do
    get xml_document_url(@xml_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_xml_document_url(@xml_document)
    assert_response :success
  end

  test "should update xml_document" do
    patch xml_document_url(@xml_document), params: { xml_document: { name: @xml_document.name, s3: @xml_document.s3 } }
    assert_redirected_to xml_document_url(@xml_document)
  end

  test "should destroy xml_document" do
    assert_difference("XmlDocument.count", -1) do
      delete xml_document_url(@xml_document)
    end

    assert_redirected_to xml_documents_url
  end
end
