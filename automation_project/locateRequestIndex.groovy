def inputFile = 'D:/ws/main/sources/lib/Debug/Record/move-link1/Record/Recording.xml'
def reqInstId = 'a0b7fc48-1d36-4173-89f6-ea772d551585'

def requests = new XmlParser().parse(inputFile)
requests.Request.Content.Exec.InstId.eachWithIndex { instId, index ->
    if (instId.text() == reqInstId) {
        println index + 1
        return
    }
}


    