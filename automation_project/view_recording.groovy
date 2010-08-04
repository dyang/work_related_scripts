// input: automation result name (without postfix)
// e.g. "iteration" for iteration.autoscr 
//
// arguments:
// -r (default, optional) - open Recording.xml
// -s - open RecordSummary.xml

if (args.size() < 1) {
    println "Please input test result file name (without .autoscr)"
    return 1
}

xml_name = 'Recording.xml'
zip_name = ''
if (args.size() == 2) {
    println args[0]
    switch (args[0]) {
        case '-r':
            xml_name = 'Recording.xml'
            break
        case '-s':
            xml_name= 'RecordSummary.xml'
            break
    }
    zip_name = args[1]
} else {
    zip_name = args[0]
}

dir = new File("Record/${zip_name}")
if (!dir.exists()) {
    file = new File("Record/${zip_name}.autoscr")
    if (!file.exists()) {
        println "ERROR: file ${file} not found"
        return 2
    }
    
    // unzip
    println "Unzipping Record/${zip_name}.autoscr..."
    println "7z -oRecord/${zip_name} x Record/${zip_name}.autoscr".execute().text    
}

println "Openning Record/${zip_name}/Record/${xml_name}..."
"firefox Record/${zip_name}/Record/${xml_name}".execute()

