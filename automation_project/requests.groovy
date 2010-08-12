def highlightName = 'Check in File With Dependencies'
def requests = new XmlParser().parse('D:/ws/main/sources/lib/Debug/Record/2170/Record/Recording.xml')
requests.Request.Attributes.Name.each { 
    def name = (it.text() == highlightName) ? "***${it.text()}" : it.text()
    println name
}
