<p style="color: green"><%= notice %></p>

<%= render @xml_document %>

<div>
  <%= link_to "Edit this xml document", edit_xml_document_path(@xml_document) %> |
  <%= link_to "Back to xml documents", xml_documents_path %>

  <%= button_to "Destroy this xml document", @xml_document, method: :delete %>
</div>
