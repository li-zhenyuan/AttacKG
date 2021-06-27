graph [
  directed 1
  node [
    id 0
    label "RPC@ExeFile"
    type "ExeFile"
    nlp "RPC"
  ]
  node [
    id 1
    label "context@ExeFile"
    type "ExeFile"
    nlp "context"
  ]
  node [
    id 2
    label "protocol@ExeFile"
    type "ExeFile"
    nlp "protocol"
  ]
  node [
    id 3
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 2
    target 0
    action "underlying"
  ]
]
