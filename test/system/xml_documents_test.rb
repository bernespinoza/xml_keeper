require "application_system_test_case"

class XmlDocumentsTest < ApplicationSystemTestCase
  setup do
    @xml_document = xml_documents(:one)
  end

  test "visiting the index" do
    visit xml_documents_url
    assert_selector "h1", text: "Xml documents"
  end

  test "should create xml document" do
    visit xml_documents_url
    click_on "New xml document"

    fill_in "Name", with: @xml_document.name
    fill_in "S3", with: @xml_document.s3
    click_on "Create Xml document"

    assert_text "Xml document was successfully created"
    click_on "Back"
  end

  test "should update Xml document" do
    visit xml_document_url(@xml_document)
    click_on "Edit this xml document", match: :first

    fill_in "Name", with: @xml_document.name
    fill_in "S3", with: @xml_document.s3
    click_on "Update Xml document"

    assert_text "Xml document was successfully updated"
    click_on "Back"
  end

  test "should destroy Xml document" do
    visit xml_document_url(@xml_document)
    click_on "Destroy this xml document", match: :first

    assert_text "Xml document was successfully destroyed"
  end
end
