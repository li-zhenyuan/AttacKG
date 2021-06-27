graph [
  directed 1
  node [
    id 0
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 1
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 2
    label "iPhone@ExeFile"
    type "ExeFile"
    nlp "iPhone"
  ]
  node [
    id 3
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 4
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 5
    label "Documentation@DocumentFile"
    type "DocumentFile"
    nlp "Documentation"
  ]
  node [
    id 6
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  edge [
    source 4
    target 3
    action "was"
  ]
]
