graph [
  directed 1
  node [
    id 0
    label "ModifiableScheduledTaskFile@Service"
    type "Service"
    nlp "ModifiableScheduledTaskFile"
  ]
  node [
    id 1
    label "WmiCommand@ExeFile"
    type "ExeFile"
    nlp "WmiCommand"
  ]
  node [
    id 2
    label "EncodedCommand@ExeFile"
    type "ExeFile"
    nlp "EncodedCommand"
  ]
  node [
    id 3
    label "DLL@ExeFile"
    type "ExeFile"
    nlp "DLL"
  ]
  node [
    id 4
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 5
    label "WMI@ExeFile"
    type "ExeFile"
    nlp "WMI"
  ]
  node [
    id 6
    label "channel@ExeFile"
    type "ExeFile"
    nlp "channel"
  ]
  node [
    id 7
    label "C2@ExeFile"
    type "ExeFile"
    nlp "C2"
  ]
  node [
    id 8
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 9
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 10
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 11
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 12
    label "CredentialInjection@DocumentFile"
    type "DocumentFile"
    nlp "CredentialInjection"
  ]
  node [
    id 13
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 14
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 15
    label "structures@ExeFile"
    type "ExeFile"
    nlp "structures"
  ]
  node [
    id 16
    label "NTFS@ExeFile"
    type "ExeFile"
    nlp "NTFS"
  ]
  node [
    id 17
    label "VaultCredential@DocumentFile"
    type "DocumentFile"
    nlp "VaultCredential"
  ]
  node [
    id 18
    label "address@ExeFile"
    type "ExeFile"
    nlp "address"
  ]
  node [
    id 19
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 20
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 21
    label "project@ExeFile"
    type "ExeFile"
    nlp "project"
  ]
  node [
    id 22
    label "PowerSploit@ExeFile"
    type "ExeFile"
    nlp "PowerSploit"
  ]
  node [
    id 23
    label "folder@ExeFile"
    type "ExeFile"
    nlp "folder"
  ]
  node [
    id 24
    label "module@ExeFile"
    type "ExeFile"
    nlp "module"
  ]
  node [
    id 25
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 26
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 27
    label "v3@ExeFile"
    type "ExeFile"
    nlp "v3"
  ]
  node [
    id 28
    label "Internet\@ExeFile"
    type "ExeFile"
    nlp "Internet\"
  ]
  node [
    id 29
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 30
    label "functions@ExeFile"
    type "ExeFile"
    nlp "functions"
  ]
  node [
    id 31
    label "http://blogs.technet.com/b/heyscriptingguy/archive/2011/05/19/create-custom-objects-in-your-powershell-script.aspx@ExeFile"
    type "ExeFile"
    nlp "http://blogs.technet.com/b/heyscriptingguy/archive/2011/05/19/create-custom-objects-in-your-powershell-script.aspx"
  ]
  node [
    id 32
    label "license@ExeFile"
    type "ExeFile"
    nlp "license"
  ]
  node [
    id 33
    label "BSD@ExeFile"
    type "ExeFile"
    nlp "BSD"
  ]
  node [
    id 34
    label "verb@ExeFile"
    type "ExeFile"
    nlp "verb"
  ]
  node [
    id 35
    label "PSReflect@ExeFile"
    type "ExeFile"
    nlp "PSReflect"
  ]
  edge [
    source 1
    target 5
    action "formatted"
  ]
  edge [
    source 2
    target 9
    action "generates"
  ]
  edge [
    source 4
    target 11
    action "generates"
  ]
  edge [
    source 4
    target 28
    action "following"
  ]
  edge [
    source 4
    target 9
    action "are"
  ]
  edge [
    source 4
    target 34
    action "follow"
  ]
  edge [
    source 5
    target 6
    action "formatted"
  ]
  edge [
    source 6
    target 7
    action "formatted"
  ]
  edge [
    source 8
    target 27
    action "want"
  ]
  edge [
    source 9
    target 10
    action "generates"
  ]
  edge [
    source 10
    target 4
    action "Add"
  ]
  edge [
    source 13
    target 14
    action "triggering"
  ]
  edge [
    source 13
    target 17
    action "Get"
  ]
  edge [
    source 15
    target 16
    action "parsing"
  ]
  edge [
    source 21
    target 22
    action "noted"
  ]
  edge [
    source 22
    target 8
    action "noted"
  ]
  edge [
    source 23
    target 22
    action "install"
  ]
  edge [
    source 24
    target 4
    action "are"
  ]
  edge [
    source 24
    target 35
    action "use"
  ]
  edge [
    source 25
    target 26
    action "imported"
  ]
  edge [
    source 27
    target 4
    action "following"
  ]
  edge [
    source 30
    target 4
    action "are"
  ]
  edge [
    source 32
    target 33
    action "prevent"
  ]
]
