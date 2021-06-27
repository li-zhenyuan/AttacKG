graph [
  directed 1
  node [
    id 0
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 1
    label "Factory@APTFamily"
    type "APTFamily"
    nlp "Factory"
  ]
  node [
    id 2
    label "IoT@ExeFile"
    type "ExeFile"
    nlp "IoT"
  ]
  node [
    id 3
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 4
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 5
    label "backdoor@ExeFile"
    type "ExeFile"
    nlp "backdoor"
  ]
  node [
    id 6
    label "DLL@ExeFile"
    type "ExeFile"
    nlp "DLL"
  ]
  node [
    id 7
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 8
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 9
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 10
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 11
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 12
    label "MSI@ExeFile"
    type "ExeFile"
    nlp "MSI"
  ]
  node [
    id 13
    label "project@ExeFile"
    type "ExeFile"
    nlp "project"
  ]
  node [
    id 14
    label "TSSL@ExeFile"
    type "ExeFile"
    nlp "TSSL"
  ]
  node [
    id 15
    label "hijacking@ExeFile"
    type "ExeFile"
    nlp "hijacking"
  ]
  node [
    id 16
    label "string@ExeFile"
    type "ExeFile"
    nlp "string"
  ]
  node [
    id 17
    label "PDB@ExeFile"
    type "ExeFile"
    nlp "PDB"
  ]
  node [
    id 18
    label "FakeRun@ExeFile"
    type "ExeFile"
    nlp "FakeRun"
  ]
  node [
    id 19
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 20
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 21
    label "information@ExeFile"
    type "ExeFile"
    nlp "information"
  ]
  node [
    id 22
    label "certificate@ExeFile"
    type "ExeFile"
    nlp "certificate"
  ]
  node [
    id 23
    label "SSL@ExeFile"
    type "ExeFile"
    nlp "SSL"
  ]
  node [
    id 24
    label "version@ExeFile"
    type "ExeFile"
    nlp "version"
  ]
  node [
    id 25
    label "v3.0@ExeFile"
    type "ExeFile"
    nlp "v3.0"
  ]
  node [
    id 26
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 27
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 28
    label "communication@ExeFile"
    type "ExeFile"
    nlp "communication"
  ]
  edge [
    source 3
    target 4
    action "Here\xe2\x80\x99s"
  ]
  edge [
    source 3
    target 9
    action "connect"
  ]
  edge [
    source 5
    target 6
    action "inject"
  ]
  edge [
    source 7
    target 8
    action "is"
  ]
  edge [
    source 7
    target 10
    action "deliver"
  ]
  edge [
    source 11
    target 12
    action "creates"
  ]
  edge [
    source 12
    target 11
    action "belonging"
  ]
  edge [
    source 13
    target 14
    action "has"
  ]
  edge [
    source 13
    target 24
    action "has"
  ]
  edge [
    source 14
    target 25
    action "indicating"
  ]
  edge [
    source 15
    target 6
    action "uses"
  ]
  edge [
    source 16
    target 17
    action "be"
  ]
  edge [
    source 17
    target 18
    action "be"
  ]
  edge [
    source 19
    target 9
    action "found"
  ]
  edge [
    source 21
    target 9
    action "decrypt"
  ]
  edge [
    source 22
    target 23
    action "found"
  ]
  edge [
    source 23
    target 19
    action "found"
  ]
  edge [
    source 24
    target 14
    action "indicating"
  ]
  edge [
    source 25
    target 10
    action "depending"
  ]
  edge [
    source 26
    target 3
    action "abused"
  ]
  edge [
    source 27
    target 7
    action "baiting"
  ]
]
