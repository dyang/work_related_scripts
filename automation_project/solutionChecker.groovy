new File('h:/Client').eachFileRecurse {
    if (it.name =~ /.*\.sln$/) {
        if (it.text.contains('Connectivity.Explorer.WorkspaceSync.csproj'))
            println it.name
    }
}