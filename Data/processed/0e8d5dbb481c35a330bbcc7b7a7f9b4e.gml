graph [
  directed 1
  node [
    id 0
    label "Teamwork@APTFamily"
    type "APTFamily"
    nlp "Teamwork"
  ]
  node [
    id 1
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 2
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 3
    label "call@ExeFile"
    type "ExeFile"
    nlp "call"
  ]
  node [
    id 4
    label "Zoom@ExeFile"
    type "ExeFile"
    nlp "Zoom"
  ]
  node [
    id 5
    label "address@ExeFile"
    type "ExeFile"
    nlp "address"
  ]
  node [
    id 6
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 7
    label "keys@ExeFile"
    type "ExeFile"
    nlp "keys"
  ]
  node [
    id 8
    label "SSH@ExeFile"
    type "ExeFile"
    nlp "SSH"
  ]
  node [
    id 9
    label "GRT@ExeFile"
    type "ExeFile"
    nlp "GRT"
  ]
  node [
    id 10
    label "logs@ExeFile"
    type "ExeFile"
    nlp "logs"
  ]
  node [
    id 11
    label "CloudTrail@ExeFile"
    type "ExeFile"
    nlp "CloudTrail"
  ]
  node [
    id 12
    label "Incident@ExeFile"
    type "ExeFile"
    nlp "Incident"
  ]
  node [
    id 13
    label "incident@ExeFile"
    type "ExeFile"
    nlp "incident"
  ]
  node [
    id 14
    label "SOC@ExeFile"
    type "ExeFile"
    nlp "SOC"
  ]
  node [
    id 15
    label "shift@ExeFile"
    type "ExeFile"
    nlp "shift"
  ]
  node [
    id 16
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 17
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 18
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 19
    label "SDK@ExeFile"
    type "ExeFile"
    nlp "SDK"
  ]
  edge [
    source 1
    target 9
    action "consists"
  ]
  edge [
    source 3
    target 4
    action "reviewed"
  ]
  edge [
    source 5
    target 6
    action "was"
  ]
  edge [
    source 7
    target 8
    action "created"
  ]
  edge [
    source 10
    target 11
    action "answer"
  ]
  edge [
    source 12
    target 9
    action "perform"
  ]
  edge [
    source 13
    target 9
    action "understand"
  ]
  edge [
    source 14
    target 15
    action "is"
  ]
]
