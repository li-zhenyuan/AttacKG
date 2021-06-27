graph [
  directed 1
  node [
    id 0
    label "attackers@ExeFile"
    type "ExeFile"
    nlp "attackers"
  ]
  node [
    id 1
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 2
    label "field@ExeFile"
    type "ExeFile"
    nlp "field"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "cases@ExeFile"
    type "ExeFile"
    nlp "cases"
  ]
  node [
    id 5
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 6
    label "control@ExeFile"
    type "ExeFile"
    nlp "control"
  ]
  node [
    id 7
    label "operations@ExeFile"
    type "ExeFile"
    nlp "operations"
  ]
  node [
    id 8
    label "vulnerability@ExeFile"
    type "ExeFile"
    nlp "vulnerability"
  ]
  node [
    id 9
    label "HeartBleed@ExeFile"
    type "ExeFile"
    nlp "HeartBleed"
  ]
  node [
    id 10
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 11
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 12
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 13
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 14
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 15
    label "industry@ExeFile"
    type "ExeFile"
    nlp "industry"
  ]
  node [
    id 16
    label "defense@ExeFile"
    type "ExeFile"
    nlp "defense"
  ]
  node [
    id 17
    label "addresses@ExeFile"
    type "ExeFile"
    nlp "addresses"
  ]
  node [
    id 18
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 19
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 20
    label "tools@ExeFile"
    type "ExeFile"
    nlp "tools"
  ]
  node [
    id 21
    label "NirSoft@ExeFile"
    type "ExeFile"
    nlp "NirSoft"
  ]
  node [
    id 22
    label "campaign@ExeFile"
    type "ExeFile"
    nlp "campaign"
  ]
  node [
    id 23
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  edge [
    source 0
    target 1
    action "creating"
  ]
  edge [
    source 2
    target 1
    action "working"
  ]
  edge [
    source 3
    target 4
    action "had"
  ]
  edge [
    source 3
    target 5
    action "leading"
  ]
  edge [
    source 3
    target 7
    action "uses"
  ]
  edge [
    source 3
    target 12
    action "is"
  ]
  edge [
    source 4
    target 1
    action "had"
  ]
  edge [
    source 5
    target 6
    action "leading"
  ]
  edge [
    source 7
    target 1
    action "uses"
  ]
  edge [
    source 8
    target 9
    action "using"
  ]
  edge [
    source 9
    target 10
    action "get"
  ]
  edge [
    source 15
    target 16
    action "used"
  ]
  edge [
    source 17
    target 18
    action "get"
  ]
  edge [
    source 20
    target 21
    action "gsecdump"
  ]
  edge [
    source 22
    target 1
    action "is"
  ]
]
