class CreateXmlDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :xml_documents do |t|
      t.string :name
      t.text :s3

      t.timestamps
    end
  end
end
