graph [
  directed 1
  node [
    id 0
    label "Actor@APTFamily"
    type "APTFamily"
    nlp "Actor"
  ]
  node [
    id 1
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 2
    label "TeamJuly@APTFamily"
    type "APTFamily"
    nlp "TeamJuly"
  ]
  node [
    id 3
    label "implant@ExeFile"
    type "ExeFile"
    nlp "implant"
  ]
  node [
    id 4
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 5
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 6
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 7
    label "ISMDoor@ExeFile"
    type "ExeFile"
    nlp "ISMDoor"
  ]
  node [
    id 8
    label "transport@ExeFile"
    type "ExeFile"
    nlp "transport"
  ]
  node [
    id 9
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 10
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 11
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 12
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 13
    label "infrastructure@ExeFile"
    type "ExeFile"
    nlp "infrastructure"
  ]
  node [
    id 14
    label "C2@ExeFile"
    type "ExeFile"
    nlp "C2"
  ]
  node [
    id 15
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 16
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 17
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 18
    label "APT34@APTFamily"
    type "APTFamily"
    nlp "APT34"
  ]
  node [
    id 19
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 20
    label "CrowdStrike@ExeFile"
    type "ExeFile"
    nlp "CrowdStrike"
  ]
  node [
    id 21
    label "group@ExeFile"
    type "ExeFile"
    nlp "group"
  ]
  node [
    id 22
    label "eCrime@ExeFile"
    type "ExeFile"
    nlp "eCrime"
  ]
  node [
    id 23
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  edge [
    source 3
    target 4
    action "is"
  ]
  edge [
    source 8
    target 9
    action "is"
  ]
  edge [
    source 12
    target 13
    action "requires"
  ]
  edge [
    source 12
    target 19
    action "discovers"
  ]
  edge [
    source 13
    target 14
    action "work"
  ]
  edge [
    source 14
    target 15
    action "work"
  ]
  edge [
    source 15
    target 9
    action "work"
  ]
  edge [
    source 16
    target 4
    action "connects"
  ]
  edge [
    source 18
    target 12
    action "associated"
  ]
  edge [
    source 19
    target 20
    action "discovers"
  ]
  edge [
    source 21
    target 22
    action "known"
  ]
]
