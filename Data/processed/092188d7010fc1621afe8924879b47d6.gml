graph [
  directed 1
  node [
    id 0
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 1
    label "component@ExeFile"
    type "ExeFile"
    nlp "component"
  ]
  node [
    id 2
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 3
    label "CreateJob@ExeFile"
    type "ExeFile"
    nlp "CreateJob"
  ]
  node [
    id 4
    label "interface@ExeFile"
    type "ExeFile"
    nlp "interface"
  ]
  node [
    id 5
    label "COM@ExeFile"
    type "ExeFile"
    nlp "COM"
  ]
  edge [
    source 1
    target 2
    action "detected"
  ]
  edge [
    source 3
    target 4
    action "ituses"
  ]
  edge [
    source 4
    target 5
    action "configure"
  ]
]
