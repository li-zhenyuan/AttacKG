graph [
  directed 1
  node [
    id 0
    label "configurationSynopsisservice.serviceDescription\xc2\xb6A@ExeFile"
    type "ExeFile"
    nlp "configurationSynopsisservice.serviceDescription\xc2\xb6A"
  ]
  node [
    id 1
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 2
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 3
    label "SysV@ExeFile"
    type "ExeFile"
    nlp "SysV"
  ]
  node [
    id 4
    label "init@ExeFile"
    type "ExeFile"
    nlp "init"
  ]
  node [
    id 5
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "DefaultDependencies@ExeFile"
    type "ExeFile"
    nlp "DefaultDependencies"
  ]
  node [
    id 8
    label "channel@ExeFile"
    type "ExeFile"
    nlp "channel"
  ]
  node [
    id 9
    label "IPC@ExeFile"
    type "ExeFile"
    nlp "IPC"
  ]
  node [
    id 10
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 11
    label "PID@ExeFile"
    type "ExeFile"
    nlp "PID"
  ]
  node [
    id 12
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 13
    label "ExecStart=\xc2\xb6Commands@ExeFile"
    type "ExeFile"
    nlp "ExecStart=\xc2\xb6Commands"
  ]
  node [
    id 14
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 15
    label "Commands@ExeFile"
    type "ExeFile"
    nlp "Commands"
  ]
  node [
    id 16
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 17
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 18
    label "stanzas@ExeFile"
    type "ExeFile"
    nlp "stanzas"
  ]
  node [
    id 19
    label "CapabilityBoundingSet=@ExeFile"
    type "ExeFile"
    nlp "CapabilityBoundingSet="
  ]
  node [
    id 20
    label "command(s@ExeFile"
    type "ExeFile"
    nlp "command(s"
  ]
  node [
    id 21
    label "ExecReload=\xc2\xb6Commands@ExeFile"
    type "ExeFile"
    nlp "ExecReload=\xc2\xb6Commands"
  ]
  node [
    id 22
    label "SIGABRT@ExeFile"
    type "ExeFile"
    nlp "SIGABRT"
  ]
  node [
    id 23
    label "RuntimeMaxSec=@ExeFile"
    type "ExeFile"
    nlp "RuntimeMaxSec="
  ]
  node [
    id 24
    label "descriptors@ExeFile"
    type "ExeFile"
    nlp "descriptors"
  ]
  node [
    id 25
    label "descriptor@ExeFile"
    type "ExeFile"
    nlp "descriptor"
  ]
  node [
    id 26
    label "USBFunctionDescriptors=@ExeFile"
    type "ExeFile"
    nlp "USBFunctionDescriptors="
  ]
  node [
    id 27
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 28
    label "program@ExeFile"
    type "ExeFile"
    nlp "program"
  ]
  edge [
    source 1
    target 6
    action "marked"
  ]
  edge [
    source 1
    target 1
    action "be"
  ]
  edge [
    source 1
    target 20
    action "are"
  ]
  edge [
    source 2
    target 3
    action "found"
  ]
  edge [
    source 3
    target 4
    action "found"
  ]
  edge [
    source 4
    target 2
    action "removed"
  ]
  edge [
    source 6
    target 6
    action "ExecStopPost=.If"
  ]
  edge [
    source 6
    target 14
    action "described"
  ]
  edge [
    source 6
    target 1
    action "skipped"
  ]
  edge [
    source 8
    target 9
    action "is"
  ]
  edge [
    source 10
    target 11
    action "are"
  ]
  edge [
    source 12
    target 11
    action "avoids"
  ]
  edge [
    source 15
    target 6
    action "providing"
  ]
  edge [
    source 17
    target 6
    action "changing"
  ]
  edge [
    source 18
    target 19
    action "allowed"
  ]
  edge [
    source 19
    target 16
    action "spawned"
  ]
  edge [
    source 24
    target 25
    action "were"
  ]
  edge [
    source 24
    target 24
    action "passed"
  ]
]
