def highlightName = ['DeleteLinks', 'GetUpdatedEntityLinks', 'GetEntityClass']
def requests = new XmlParser().parse('D:/ws/main/sources/lib/Debug/Record/del-link1/Record/Recording.xml')
requests.Request.Attributes.Name.eachWithIndex { req, index -> 
    def name = highlightName.contains(req.text()) ? "***${req.text()}" : req.text()
    println "${index + 1} - ${name}"
}