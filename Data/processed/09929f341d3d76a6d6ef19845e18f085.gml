graph [
  directed 1
  node [
    id 0
    label "Subscriptions@ExeFile"
    type "ExeFile"
    nlp "Subscriptions"
  ]
  node [
    id 1
    label "IoT@ExeFile"
    type "ExeFile"
    nlp "IoT"
  ]
  node [
    id 2
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 3
    label "descriptions@ExeFile"
    type "ExeFile"
    nlp "descriptions"
  ]
  node [
    id 4
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 5
    label "reports@ExeFile"
    type "ExeFile"
    nlp "reports"
  ]
  node [
    id 6
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 7
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 8
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 9
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 10
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 11
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 12
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 13
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 14
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 15
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 16
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 17
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 18
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 19
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 20
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 21
    label "SQL@ExeFile"
    type "ExeFile"
    nlp "SQL"
  ]
  node [
    id 22
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 23
    label "tasking@Service"
    type "Service"
    nlp "tasking"
  ]
  node [
    id 24
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 25
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 26
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 27
    label "APT10@APTFamily"
    type "APTFamily"
    nlp "APT10"
  ]
  node [
    id 28
    label "communication@ExeFile"
    type "ExeFile"
    nlp "communication"
  ]
  node [
    id 29
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  edge [
    source 5
    target 6
    action "discussed"
  ]
  edge [
    source 7
    target 5
    action "discovered"
  ]
  edge [
    source 7
    target 28
    action "facing"
  ]
  edge [
    source 8
    target 7
    action "tailored"
  ]
  edge [
    source 8
    target 15
    action "including"
  ]
  edge [
    source 8
    target 12
    action "established"
  ]
  edge [
    source 8
    target 8
    action "discovered"
  ]
  edge [
    source 9
    target 7
    action "thinks"
  ]
  edge [
    source 10
    target 27
    action "report"
  ]
  edge [
    source 12
    target 8
    action "located"
  ]
  edge [
    source 12
    target 12
    action "discarding"
  ]
  edge [
    source 17
    target 18
    action "deceiving"
  ]
  edge [
    source 18
    target 11
    action "deceiving"
  ]
  edge [
    source 20
    target 21
    action "designed"
  ]
  edge [
    source 21
    target 22
    action "designed"
  ]
  edge [
    source 26
    target 25
    action "Save"
  ]
  edge [
    source 27
    target 7
    action "discovered"
  ]
  edge [
    source 28
    target 29
    action "controlled"
  ]
]
