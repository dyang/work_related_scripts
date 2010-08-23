def highlightName = ['DeleteLinks', 'GetUpdatedEntityLinks', 'GetEntityClass']
def requests = new XmlParser().parse('D:/ws/main/sources/lib/Debug/Record/del-link1/Record/Recording.xml')
requests.Request.Attributes.Name.each { 
    def name = highlightName.contains(it.text()) ? "***${it.text()}" : it.text()
    println name
}