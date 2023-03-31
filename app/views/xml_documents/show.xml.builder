xml.instruct!
xml.result do

  xml.content do
    xml.status 'success'
  end

  xml.customer do
    xml.create 'true'
    xml.description 'Mock response'
    xml.customerid @xml_document.id
    xml.name 'test'
    xml.termname 't'
    xml.auto_employee ''
    xml.auto_commission_start_date '03/03/23'
    xml.auto_commission_end_date '03/03/23'
    xml.auto_commission_rate '20'
    xml.property_employee 'na'
    xml.property_commission_start_date 'na'
    xml.property_commission_end_date 'na'
    xml.property_commission_rate 'na'
    xml.subro_employee 'na'
    xml.subro_commission_start_date 'na'
    xml.subro_commission_end_date 'na'
    xml.subro_commission_rate 'na'
  end

  xml.request do
    xml.requestid @xml_document.id
    xml.xml_document do
      xml.name @xml_document.name
      file = Nokogiri::XML(@xml_document.file.download)
      #xml.file file
      leaves = file.xpath('//*[not(*)]')
      leaves.each do |node|
        xml.tag!(node.name, node.text)
      end
    end
  end
end
