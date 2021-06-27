graph [
  directed 1
  node [
    id 0
    label "taskbar@Service"
    type "Service"
    nlp "taskbar"
  ]
  node [
    id 1
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 2
    label "PBlock+@ExeFile"
    type "ExeFile"
    nlp "PBlock+"
  ]
  node [
    id 3
    label "adware@ExeFile"
    type "ExeFile"
    nlp "adware"
  ]
  node [
    id 4
    label "TDSSKiller@ExeFile"
    type "ExeFile"
    nlp "TDSSKiller"
  ]
  node [
    id 5
    label "rootkit@ExeFile"
    type "ExeFile"
    nlp "rootkit"
  ]
  node [
    id 6
    label "Alureon@ExeFile"
    type "ExeFile"
    nlp "Alureon"
  ]
  node [
    id 7
    label "SensePost@ExeFile"
    type "ExeFile"
    nlp "SensePost"
  ]
  node [
    id 8
    label "tutorial@ExeFile"
    type "ExeFile"
    nlp "tutorial"
  ]
  node [
    id 9
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 10
    label "OLE@ExeFile"
    type "ExeFile"
    nlp "OLE"
  ]
  node [
    id 11
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 12
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 13
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 14
    label "options@ExeFile"
    type "ExeFile"
    nlp "options"
  ]
  node [
    id 15
    label "GUI@ExeFile"
    type "ExeFile"
    nlp "GUI"
  ]
  node [
    id 16
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 17
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 18
    label "cars@ExeFile"
    type "ExeFile"
    nlp "cars"
  ]
  node [
    id 19
    label "GM@ExeFile"
    type "ExeFile"
    nlp "GM"
  ]
  node [
    id 20
    label "VBA@ExeFile"
    type "ExeFile"
    nlp "VBA"
  ]
  node [
    id 21
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 22
    label "BleepingComputer@ExeFile"
    type "ExeFile"
    nlp "BleepingComputer"
  ]
  node [
    id 23
    label "NA@ExeFile"
    type "ExeFile"
    nlp "NA"
  ]
  edge [
    source 0
    target 1
    action "targets"
  ]
  edge [
    source 1
    target 1
    action "explained"
  ]
  edge [
    source 1
    target 8
    action "explained"
  ]
  edge [
    source 1
    target 7
    action "specialized"
  ]
  edge [
    source 1
    target 10
    action "running"
  ]
  edge [
    source 1
    target 16
    action "covers"
  ]
  edge [
    source 2
    target 3
    action "remove"
  ]
  edge [
    source 4
    target 5
    action "using"
  ]
  edge [
    source 5
    target 6
    action "using"
  ]
  edge [
    source 7
    target 1
    action "distribute"
  ]
  edge [
    source 8
    target 1
    action "specialized"
  ]
  edge [
    source 12
    target 13
    action "controls"
  ]
  edge [
    source 14
    target 15
    action "details"
  ]
  edge [
    source 18
    target 19
    action "are"
  ]
]
