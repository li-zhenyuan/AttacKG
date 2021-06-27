graph [
  directed 1
  node [
    id 0
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 1
    label "TeamJuly@APTFamily"
    type "APTFamily"
    nlp "TeamJuly"
  ]
  node [
    id 2
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 3
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 4
    label "teams@APTFamily"
    type "APTFamily"
    nlp "teams"
  ]
  node [
    id 5
    label "notice@ExeFile"
    type "ExeFile"
    nlp "notice"
  ]
  node [
    id 6
    label "moment\xe2\x80\x99s@ExeFile"
    type "ExeFile"
    nlp "moment\xe2\x80\x99s"
  ]
  node [
    id 7
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 8
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 9
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 10
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 11
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 12
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 13
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 14
    label "BloodHound@ExeFile"
    type "ExeFile"
    nlp "BloodHound"
  ]
  node [
    id 15
    label "web@ExeFile"
    type "ExeFile"
    nlp "web"
  ]
  node [
    id 16
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 17
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 18
    label "CSV@ExeFile"
    type "ExeFile"
    nlp "CSV"
  ]
  node [
    id 19
    label "\xe2\x80\x9cNode@ExeFile"
    type "ExeFile"
    nlp "\xe2\x80\x9cNode"
  ]
  node [
    id 20
    label "Info\xe2\x80\x9d@ExeFile"
    type "ExeFile"
    nlp "Info\xe2\x80\x9d"
  ]
  node [
    id 21
    label "Services@ExeFile"
    type "ExeFile"
    nlp "Services"
  ]
  node [
    id 22
    label "CrowdStrike@ExeFile"
    type "ExeFile"
    nlp "CrowdStrike"
  ]
  edge [
    source 4
    target 5
    action "respond"
  ]
  edge [
    source 4
    target 4
    action "provides"
  ]
  edge [
    source 5
    target 6
    action "respond"
  ]
  edge [
    source 10
    target 9
    action "spread"
  ]
  edge [
    source 12
    target 13
    action "is"
  ]
  edge [
    source 13
    target 14
    action "using"
  ]
  edge [
    source 14
    target 15
    action "using"
  ]
  edge [
    source 15
    target 14
    action "using"
  ]
  edge [
    source 16
    target 17
    action "save"
  ]
  edge [
    source 17
    target 18
    action "shown"
  ]
  edge [
    source 19
    target 20
    action "populate"
  ]
  edge [
    source 21
    target 22
    action "released"
  ]
]
