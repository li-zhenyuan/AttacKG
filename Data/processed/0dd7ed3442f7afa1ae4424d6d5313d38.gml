graph [
  directed 1
  node [
    id 0
    label "COM@ExeFile"
    type "ExeFile"
    nlp "COM"
  ]
  node [
    id 1
    label "application@ExeFile"
    type "ExeFile"
    nlp "application"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "Trojan@ExeFile"
    type "ExeFile"
    nlp "Trojan"
  ]
  node [
    id 4
    label "CreateJob@ExeFile"
    type "ExeFile"
    nlp "CreateJob"
  ]
  node [
    id 5
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  edge [
    source 0
    target 1
    action "is"
  ]
  edge [
    source 2
    target 4
    action "using"
  ]
]
