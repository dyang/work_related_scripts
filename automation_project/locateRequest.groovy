def inputFile = 'D:/ws/main/sources/lib/Debug/Record/del-link1/Record/Recording.xml'
def reqSequence = 181

def requests = new XmlParser().parse(inputFile)
println requests.Request[reqSequence-1].Content[0].Exec[0].InstId.text()