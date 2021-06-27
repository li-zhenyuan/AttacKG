graph [
  directed 1
  node [
    id 0
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 1
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 2
    label "value@ExeFile"
    type "ExeFile"
    nlp "value"
  ]
  node [
    id 3
    label "DWORD@ExeFile"
    type "ExeFile"
    nlp "DWORD"
  ]
  node [
    id 4
    label "protection@ExeFile"
    type "ExeFile"
    nlp "protection"
  ]
  node [
    id 5
    label "DMA@ExeFile"
    type "ExeFile"
    nlp "DMA"
  ]
  node [
    id 6
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 7
    label "entries@ExeFile"
    type "ExeFile"
    nlp "entries"
  ]
  node [
    id 8
    label "FirstLogonCommands@ExeFile"
    type "ExeFile"
    nlp "FirstLogonCommands"
  ]
  node [
    id 9
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 10
    label "LsaIso.exe@ExeFile"
    type "ExeFile"
    nlp "LsaIso.exe"
  ]
  node [
    id 11
    label "queries@ExeFile"
    type "ExeFile"
    nlp "queries"
  ]
  node [
    id 12
    label "WMI@ExeFile"
    type "ExeFile"
    nlp "WMI"
  ]
  node [
    id 13
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 14
    label "WinInit@ExeFile"
    type "ExeFile"
    nlp "WinInit"
  ]
  node [
    id 15
    label "event@ExeFile"
    type "ExeFile"
    nlp "event"
  ]
  node [
    id 16
    label "TPM@ExeFile"
    type "ExeFile"
    nlp "TPM"
  ]
  node [
    id 17
    label "window@ExeFile"
    type "ExeFile"
    nlp "window"
  ]
  node [
    id 18
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 19
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 20
    label "Task@Service"
    type "Service"
    nlp "Task"
  ]
  node [
    id 21
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 22
    label "DISABLE@ExeFile"
    type "ExeFile"
    nlp "DISABLE"
  ]
  node [
    id 23
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 0
    action "using"
  ]
  edge [
    source 0
    target 6
    action "setting"
  ]
  edge [
    source 1
    target 0
    action "running"
  ]
  edge [
    source 2
    target 3
    action "Add"
  ]
  edge [
    source 4
    target 5
    action "use"
  ]
  edge [
    source 6
    target 7
    action "setting"
  ]
  edge [
    source 7
    target 8
    action "setting"
  ]
  edge [
    source 9
    target 0
    action "work"
  ]
  edge [
    source 11
    target 12
    action "be"
  ]
  edge [
    source 13
    target 14
    action "protect"
  ]
  edge [
    source 14
    target 15
    action "protect"
  ]
  edge [
    source 15
    target 0
    action "protect"
  ]
  edge [
    source 17
    target 18
    action "run"
  ]
  edge [
    source 18
    target 1
    action "run"
  ]
  edge [
    source 19
    target 20
    action "determining"
  ]
  edge [
    source 20
    target 0
    action "is"
  ]
  edge [
    source 21
    target 1
    action "following"
  ]
  edge [
    source 21
    target 22
    action "want"
  ]
  edge [
    source 22
    target 0
    action "turning"
  ]
]
