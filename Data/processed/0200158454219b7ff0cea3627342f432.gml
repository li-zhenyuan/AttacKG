graph [
  directed 1
  node [
    id 0
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 1
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 2
    label "directory@ExeFile"
    type "ExeFile"
    nlp "directory"
  ]
  node [
    id 3
    label "Startup@ExeFile"
    type "ExeFile"
    nlp "Startup"
  ]
  node [
    id 4
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 5
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 6
    label "malware\xe2\x80\x99s@ExeFile"
    type "ExeFile"
    nlp "malware\xe2\x80\x99s"
  ]
  node [
    id 7
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 8
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 9
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 10
    label "teams@APTFamily"
    type "APTFamily"
    nlp "teams"
  ]
  edge [
    source 1
    target 2
    action "following"
  ]
  edge [
    source 2
    target 3
    action "following"
  ]
  edge [
    source 5
    target 4
    action "using"
  ]
  edge [
    source 5
    target 1
    action "execute"
  ]
  edge [
    source 9
    target 5
    action "invoke"
  ]
]
