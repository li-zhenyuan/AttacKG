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
    label "Registry@ExeFile"
    type "ExeFile"
    nlp "Registry"
  ]
  node [
    id 2
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 3
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 1
    action "using"
  ]
]
