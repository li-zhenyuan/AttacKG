graph [
  directed 1
  node [
    id 0
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 1
    label "mitigations</description@ExeFile"
    type "ExeFile"
    nlp "mitigations</description"
  ]
  node [
    id 2
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 3
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 4
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 5
    label "authentication@ExeFile"
    type "ExeFile"
    nlp "authentication"
  ]
  node [
    id 6
    label "protection@ExeFile"
    type "ExeFile"
    nlp "protection"
  ]
  node [
    id 7
    label "LSA@ExeFile"
    type "ExeFile"
    nlp "LSA"
  ]
  node [
    id 8
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 9
    label "default@ExeFile"
    type "ExeFile"
    nlp "default"
  ]
  node [
    id 10
    label "git@ExeFile"
    type "ExeFile"
    nlp "git"
  ]
  node [
    id 11
    label "View@ExeFile"
    type "ExeFile"
    nlp "View"
  ]
  edge [
    source 1
    target 2
    action "used"
  ]
  edge [
    source 6
    target 7
    action "enabling"
  ]
  edge [
    source 8
    target 9
    action "Restores"
  ]
  edge [
    source 10
    target 11
    action "Go"
  ]
]
