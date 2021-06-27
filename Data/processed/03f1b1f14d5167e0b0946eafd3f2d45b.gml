graph [
  directed 1
  node [
    id 0
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 1
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 2
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 3
    label "Safari@ExeFile"
    type "ExeFile"
    nlp "Safari"
  ]
  node [
    id 4
    label "documentation@DocumentFile"
    type "DocumentFile"
    nlp "documentation"
  ]
  node [
    id 5
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  edge [
    source 1
    target 2
    action "stored"
  ]
  edge [
    source 2
    target 3
    action "stored"
  ]
]
