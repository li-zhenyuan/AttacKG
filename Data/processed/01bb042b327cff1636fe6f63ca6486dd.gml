graph [
  directed 1
  node [
    id 0
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 1
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 2
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 3
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 4
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 5
    label "DescriptionA@ExeFile"
    type "ExeFile"
    nlp "DescriptionA"
  ]
  node [
    id 6
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 7
    label "CMS@ExeFile"
    type "ExeFile"
    nlp "CMS"
  ]
  node [
    id 8
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 9
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 10
    label "credentials;To@DocumentFile"
    type "DocumentFile"
    nlp "credentials;To"
  ]
  node [
    id 11
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 12
    label "shell@ExeFile"
    type "ExeFile"
    nlp "shell"
  ]
  node [
    id 13
    label "WSO@ExeFile"
    type "ExeFile"
    nlp "WSO"
  ]
  node [
    id 14
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 15
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 16
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 17
    label "servers@ExeFile"
    type "ExeFile"
    nlp "servers"
  ]
  node [
    id 18
    label "DMZ@ExeFile"
    type "ExeFile"
    nlp "DMZ"
  ]
  node [
    id 19
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 20
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 21
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  edge [
    source 0
    target 8
    action "issue"
  ]
  edge [
    source 3
    target 4
    action "uploaded"
  ]
  edge [
    source 4
    target 5
    action "uploaded"
  ]
  edge [
    source 8
    target 8
    action "run"
  ]
  edge [
    source 8
    target 6
    action "run"
  ]
  edge [
    source 9
    target 10
    action "upload"
  ]
  edge [
    source 10
    target 11
    action "upload"
  ]
  edge [
    source 11
    target 8
    action "issue"
  ]
  edge [
    source 17
    target 18
    action "originating"
  ]
  edge [
    source 19
    target 3
    action "created"
  ]
]
