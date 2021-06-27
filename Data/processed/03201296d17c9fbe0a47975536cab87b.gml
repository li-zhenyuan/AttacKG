graph [
  directed 1
  node [
    id 0
    label "TeleBots\xe2\x80\x99@ExeFile"
    type "ExeFile"
    nlp "TeleBots\xe2\x80\x99"
  ]
  node [
    id 1
    label "security@ExeFile"
    type "ExeFile"
    nlp "security"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "NotPetya@ExeFile"
    type "ExeFile"
    nlp "NotPetya"
  ]
  node [
    id 4
    label "group@ExeFile"
    type "ExeFile"
    nlp "group"
  ]
  node [
    id 5
    label "TeleBots@ExeFile"
    type "ExeFile"
    nlp "TeleBots"
  ]
  node [
    id 6
    label "number@ExeFile"
    type "ExeFile"
    nlp "number"
  ]
  node [
    id 7
    label "EDRPOU@ExeFile"
    type "ExeFile"
    nlp "EDRPOU"
  ]
  node [
    id 8
    label "values@ExeFile"
    type "ExeFile"
    nlp "values"
  ]
  node [
    id 9
    label "numbers@ExeFile"
    type "ExeFile"
    nlp "numbers"
  ]
  node [
    id 10
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 11
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 12
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 13
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 14
    label "CommandPurpose@ExeFile"
    type "ExeFile"
    nlp "CommandPurpose"
  ]
  node [
    id 15
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 16
    label "PayloadDecodes@ExeFile"
    type "ExeFile"
    nlp "PayloadDecodes"
  ]
  node [
    id 17
    label "DLL@ExeFile"
    type "ExeFile"
    nlp "DLL"
  ]
  node [
    id 18
    label "folder@ExeFile"
    type "ExeFile"
    nlp "folder"
  ]
  node [
    id 19
    label "AutoPayload@ExeFile"
    type "ExeFile"
    nlp "AutoPayload"
  ]
  node [
    id 20
    label "KillDisk@ExeFile"
    type "ExeFile"
    nlp "KillDisk"
  ]
  edge [
    source 2
    target 13
    action "decrypts"
  ]
  edge [
    source 2
    target 19
    action "named"
  ]
  edge [
    source 4
    target 5
    action "uncovered"
  ]
  edge [
    source 6
    target 7
    action "identify"
  ]
  edge [
    source 8
    target 7
    action "injected"
  ]
  edge [
    source 9
    target 10
    action "including"
  ]
  edge [
    source 10
    target 7
    action "including"
  ]
  edge [
    source 11
    target 12
    action "collected"
  ]
  edge [
    source 15
    target 2
    action "named"
  ]
  edge [
    source 16
    target 17
    action "dropped"
  ]
  edge [
    source 17
    target 18
    action "using"
  ]
  edge [
    source 18
    target 12
    action "using"
  ]
]
