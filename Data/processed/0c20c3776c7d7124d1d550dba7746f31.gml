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
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 2
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 3
    label "attachments@DocumentFile"
    type "DocumentFile"
    nlp "attachments"
  ]
  node [
    id 4
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 5
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 6
    label "NirSoft@ExeFile"
    type "ExeFile"
    nlp "NirSoft"
  ]
  node [
    id 7
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 8
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 9
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 10
    label "C2@ExeFile"
    type "ExeFile"
    nlp "C2"
  ]
  node [
    id 11
    label "Tasks@Service"
    type "Service"
    nlp "Tasks"
  ]
  node [
    id 12
    label "connections@ExeFile"
    type "ExeFile"
    nlp "connections"
  ]
  node [
    id 13
    label "SMB@ExeFile"
    type "ExeFile"
    nlp "SMB"
  ]
  node [
    id 14
    label "governments@ExeFile"
    type "ExeFile"
    nlp "governments"
  ]
  edge [
    source 1
    target 0
    action "be"
  ]
  edge [
    source 2
    target 3
    action "branding"
  ]
  edge [
    source 2
    target 5
    action "have"
  ]
  edge [
    source 2
    target 2
    action "provide"
  ]
  edge [
    source 3
    target 0
    action "are"
  ]
  edge [
    source 5
    target 2
    action "send"
  ]
  edge [
    source 5
    target 14
    action "is"
  ]
  edge [
    source 7
    target 7
    action "have"
  ]
  edge [
    source 8
    target 9
    action "ends"
  ]
  edge [
    source 9
    target 10
    action "ends"
  ]
  edge [
    source 12
    target 13
    action "restricts"
  ]
]
