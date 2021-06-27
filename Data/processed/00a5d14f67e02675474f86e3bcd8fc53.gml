graph [
  directed 1
  node [
    id 0
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 1
    label "platform@ExeFile"
    type "ExeFile"
    nlp "platform"
  ]
  node [
    id 2
    label "SolarWinds@ExeFile"
    type "ExeFile"
    nlp "SolarWinds"
  ]
  node [
    id 3
    label "attack@ExeFile"
    type "ExeFile"
    nlp "attack"
  ]
  node [
    id 4
    label "authentication@ExeFile"
    type "ExeFile"
    nlp "authentication"
  ]
  node [
    id 5
    label "ADFS@ExeFile"
    type "ExeFile"
    nlp "ADFS"
  ]
  node [
    id 6
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 7
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 8
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 9
    label "Factor@APTFamily"
    type "APTFamily"
    nlp "Factor"
  ]
  node [
    id 10
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 11
    label "teams.\xe2\x80\x8dDetecting@APTFamily"
    type "APTFamily"
    nlp "teams.\xe2\x80\x8dDetecting"
  ]
  node [
    id 12
    label "credential\xe2\x80\x9d@DocumentFile"
    type "DocumentFile"
    nlp "credential\xe2\x80\x9d"
  ]
  node [
    id 13
    label "request@ExeFile"
    type "ExeFile"
    nlp "request"
  ]
  node [
    id 14
    label "TGS@ExeFile"
    type "ExeFile"
    nlp "TGS"
  ]
  node [
    id 15
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 16
    label "certificate@ExeFile"
    type "ExeFile"
    nlp "certificate"
  ]
  node [
    id 17
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 18
    label "trust@ExeFile"
    type "ExeFile"
    nlp "trust"
  ]
  node [
    id 19
    label "software@ExeFile"
    type "ExeFile"
    nlp "software"
  ]
  node [
    id 20
    label "instances@ExeFile"
    type "ExeFile"
    nlp "instances"
  ]
  edge [
    source 0
    target 3
    action "used"
  ]
  edge [
    source 0
    target 19
    action "have"
  ]
  edge [
    source 1
    target 2
    action "exist"
  ]
  edge [
    source 2
    target 0
    action "have"
  ]
  edge [
    source 3
    target 2
    action "used"
  ]
  edge [
    source 4
    target 5
    action "access"
  ]
  edge [
    source 5
    target 6
    action "access"
  ]
  edge [
    source 5
    target 9
    action "signed"
  ]
  edge [
    source 5
    target 5
    action "trusted"
  ]
  edge [
    source 5
    target 7
    action "using"
  ]
  edge [
    source 7
    target 5
    action "using"
  ]
  edge [
    source 13
    target 14
    action "create"
  ]
  edge [
    source 15
    target 16
    action "exporting"
  ]
  edge [
    source 16
    target 5
    action "exporting"
  ]
  edge [
    source 18
    target 5
    action "are"
  ]
  edge [
    source 20
    target 5
    action "are"
  ]
]
