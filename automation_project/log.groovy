log_file = (args.size() == 1) ? args[0] : 'd:/tmp/debug.log'

new File(log_file).eachLine { line ->
    if (line =~ /[\s]*\[.*/) println line
}