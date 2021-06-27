graph [
  directed 1
  node [
    id 0
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 1
    label "WebLogic@ExeFile"
    type "ExeFile"
    nlp "WebLogic"
  ]
  node [
    id 2
    label "score@ExeFile"
    type "ExeFile"
    nlp "score"
  ]
  node [
    id 3
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 4
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 5
    label "connection@ExeFile"
    type "ExeFile"
    nlp "connection"
  ]
  node [
    id 6
    label "HTTP@ExeFile"
    type "ExeFile"
    nlp "HTTP"
  ]
  node [
    id 7
    label "attachment@DocumentFile"
    type "DocumentFile"
    nlp "attachment"
  ]
  node [
    id 8
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 9
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 10
    label "Oracle@ExeFile"
    type "ExeFile"
    nlp "Oracle"
  ]
  node [
    id 11
    label "Google@ExeFile"
    type "ExeFile"
    nlp "Google"
  ]
  node [
    id 12
    label "search@ExeFile"
    type "ExeFile"
    nlp "search"
  ]
  node [
    id 13
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 14
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 15
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 16
    label "VirusTotal@ExeFile"
    type "ExeFile"
    nlp "VirusTotal"
  ]
  node [
    id 17
    label "utility@ExeFile"
    type "ExeFile"
    nlp "utility"
  ]
  node [
    id 18
    label "vssadmin.exe@ExeFile"
    type "ExeFile"
    nlp "vssadmin.exe"
  ]
  node [
    id 19
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 20
    label "victim\@ExeFile"
    type "ExeFile"
    nlp "victim\"
  ]
  node [
    id 21
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 22
    label "process@ExeFile"
    type "ExeFile"
    nlp "process"
  ]
  node [
    id 23
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 24
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  edge [
    source 0
    target 1
    action "exploit"
  ]
  edge [
    source 1
    target 10
    action "download"
  ]
  edge [
    source 3
    target 20
    action "deploying"
  ]
  edge [
    source 5
    target 6
    action "requesting"
  ]
  edge [
    source 7
    target 8
    action "running"
  ]
  edge [
    source 8
    target 9
    action "running"
  ]
  edge [
    source 11
    target 12
    action "related"
  ]
  edge [
    source 13
    target 14
    action "execute"
  ]
  edge [
    source 14
    target 15
    action "observed"
  ]
  edge [
    source 17
    target 18
    action "execute"
  ]
  edge [
    source 22
    target 1
    action "run"
  ]
]
