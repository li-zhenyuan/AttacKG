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
    label "malware\xe2\x80\x94and@ExeFile"
    type "ExeFile"
    nlp "malware\xe2\x80\x94and"
  ]
  node [
    id 2
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 3
    label "chip@ExeFile"
    type "ExeFile"
    nlp "chip"
  ]
  node [
    id 4
    label "TPM@ExeFile"
    type "ExeFile"
    nlp "TPM"
  ]
  node [
    id 5
    label "database@ExeFile"
    type "ExeFile"
    nlp "database"
  ]
  node [
    id 6
    label "UEFI@ExeFile"
    type "ExeFile"
    nlp "UEFI"
  ]
  node [
    id 7
    label "firmware@ExeFile"
    type "ExeFile"
    nlp "firmware"
  ]
  node [
    id 8
    label "kernel@ExeFile"
    type "ExeFile"
    nlp "kernel"
  ]
  node [
    id 9
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 10
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 3
    action "are"
  ]
  edge [
    source 0
    target 6
    action "trust"
  ]
  edge [
    source 1
    target 2
    action "bypassing"
  ]
  edge [
    source 2
    target 0
    action "infecting"
  ]
  edge [
    source 3
    target 4
    action "are"
  ]
  edge [
    source 5
    target 6
    action "including"
  ]
  edge [
    source 7
    target 0
    action "trust"
  ]
  edge [
    source 8
    target 2
    action "has"
  ]
]
