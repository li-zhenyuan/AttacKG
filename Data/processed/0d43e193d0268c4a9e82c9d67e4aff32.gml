graph [
  directed 1
  node [
    id 0
    label "security@ExeFile"
    type "ExeFile"
    nlp "security"
  ]
  node [
    id 1
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 2
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 3
    label "Office@ExeFile"
    type "ExeFile"
    nlp "Office"
  ]
  node [
    id 4
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 5
    label "attachment@DocumentFile"
    type "DocumentFile"
    nlp "attachment"
  ]
  node [
    id 6
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 7
    label "macro@ExeFile"
    type "ExeFile"
    nlp "macro"
  ]
  node [
    id 8
    label "VBA@ExeFile"
    type "ExeFile"
    nlp "VBA"
  ]
  node [
    id 9
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 10
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 11
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 12
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 13
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 14
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 15
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 16
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 17
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  edge [
    source 2
    target 3
    action "incorporated"
  ]
  edge [
    source 4
    target 6
    action "open"
  ]
  edge [
    source 5
    target 4
    action "open"
  ]
  edge [
    source 10
    target 11
    action "launches"
  ]
  edge [
    source 11
    target 12
    action "download"
  ]
  edge [
    source 12
    target 13
    action "tries"
  ]
  edge [
    source 13
    target 14
    action "is"
  ]
  edge [
    source 14
    target 15
    action "is"
  ]
]
