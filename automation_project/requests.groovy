requests = new XmlParser().parse('D:/ws/main/sources/lib/Debug/Record/2170/Record/Recording.xml')
requests.Request.Attributes.Name.each { 
    println it.text()
}