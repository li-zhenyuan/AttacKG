graph [
  directed 1
  node [
    id 0
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 1
    label "PsExec@ExeFile"
    type "ExeFile"
    nlp "PsExec"
  ]
  node [
    id 2
    label "Thrip@ExeFile"
    type "ExeFile"
    nlp "Thrip"
  ]
  node [
    id 3
    label "attacks@ExeFile"
    type "ExeFile"
    nlp "attacks"
  ]
  node [
    id 4
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 5
    label "contractor@APTFamily"
    type "APTFamily"
    nlp "contractor"
  ]
  node [
    id 6
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 7
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 8
    label "client@ExeFile"
    type "ExeFile"
    nlp "client"
  ]
  node [
    id 9
    label "FTP@ExeFile"
    type "ExeFile"
    nlp "FTP"
  ]
  node [
    id 10
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 11
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 12
    label "AttachmentsThrip@DocumentFile"
    type "DocumentFile"
    nlp "AttachmentsThrip"
  ]
  node [
    id 13
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 14
    label "Hunter@ExeFile"
    type "ExeFile"
    nlp "Hunter"
  ]
  node [
    id 15
    label "AuthorThreat@ExeFile"
    type "ExeFile"
    nlp "AuthorThreat"
  ]
  node [
    id 16
    label "Symantec@ExeFile"
    type "ExeFile"
    nlp "Symantec"
  ]
  node [
    id 17
    label "Factor@APTFamily"
    type "APTFamily"
    nlp "Factor"
  ]
  node [
    id 18
    label "Actors@APTFamily"
    type "APTFamily"
    nlp "Actors"
  ]
  edge [
    source 0
    target 2
    action "used"
  ]
  edge [
    source 3
    target 2
    action "launch"
  ]
  edge [
    source 6
    target 7
    action "compromised"
  ]
  edge [
    source 8
    target 9
    action "exfiltrate"
  ]
  edge [
    source 10
    target 11
    action "are"
  ]
  edge [
    source 13
    target 14
    action "based"
  ]
  edge [
    source 14
    target 15
    action "offer"
  ]
  edge [
    source 15
    target 16
    action "offer"
  ]
  edge [
    source 17
    target 18
    action "Related"
  ]
]
