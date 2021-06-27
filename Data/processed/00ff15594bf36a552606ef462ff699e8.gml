graph [
  directed 1
  node [
    id 0
    label "version@ExeFile"
    type "ExeFile"
    nlp "version"
  ]
  node [
    id 1
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 2
    label "thread@ExeFile"
    type "ExeFile"
    nlp "thread"
  ]
  node [
    id 3
    label "GUID@ExeFile"
    type "ExeFile"
    nlp "GUID"
  ]
  node [
    id 4
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 5
    label "HF_DESTROYED@ExeFile"
    type "ExeFile"
    nlp "HF_DESTROYED"
  ]
  node [
    id 6
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 7
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 8
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  edge [
    source 0
    target 1
    action "build"
  ]
  edge [
    source 2
    target 3
    action "have"
  ]
]
