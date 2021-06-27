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
    label "UNIX@ExeFile"
    type "ExeFile"
    nlp "UNIX"
  ]
  node [
    id 2
    label "daemon@ExeFile"
    type "ExeFile"
    nlp "daemon"
  ]
  node [
    id 3
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 4
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 1
    target 2
    action "is"
  ]
]
