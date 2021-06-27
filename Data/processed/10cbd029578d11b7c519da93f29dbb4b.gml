graph [
  directed 1
  node [
    id 0
    label "Teams@APTFamily"
    type "APTFamily"
    nlp "Teams"
  ]
  node [
    id 1
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 2
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 3
    label "environment@ExeFile"
    type "ExeFile"
    nlp "environment"
  ]
  node [
    id 4
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 5
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 6
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 7
    label "AppSource@ExeFile"
    type "ExeFile"
    nlp "AppSource"
  ]
  edge [
    source 3
    target 4
    action "have"
  ]
  edge [
    source 5
    target 5
    action "providing"
  ]
]
