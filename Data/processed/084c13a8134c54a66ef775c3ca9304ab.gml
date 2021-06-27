graph [
  directed 1
  node [
    id 0
    label "toolkit@ExeFile"
    type "ExeFile"
    nlp "toolkit"
  ]
  node [
    id 1
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 2
    label "request@ExeFile"
    type "ExeFile"
    nlp "request"
  ]
  node [
    id 3
    label "TGT@ExeFile"
    type "ExeFile"
    nlp "TGT"
  ]
  node [
    id 4
    label "RFC4120@ExeFile"
    type "ExeFile"
    nlp "RFC4120"
  ]
  node [
    id 5
    label "OPTIONAL,\r@ExeFile"
    type "ExeFile"
    nlp "OPTIONAL,\r"
  ]
  node [
    id 6
    label "KerberosTime@ExeFile"
    type "ExeFile"
    nlp "KerberosTime"
  ]
  node [
    id 7
    label "INTEGER@ExeFile"
    type "ExeFile"
    nlp "INTEGER"
  ]
  node [
    id 8
    label "JavaScript@ExeFile"
    type "ExeFile"
    nlp "JavaScript"
  ]
  node [
    id 9
    label "preauthentication@ExeFile"
    type "ExeFile"
    nlp "preauthentication"
  ]
  node [
    id 10
    label "Kerberos@ExeFile"
    type "ExeFile"
    nlp "Kerberos"
  ]
  node [
    id 11
    label "project@ExeFile"
    type "ExeFile"
    nlp "project"
  ]
  node [
    id 12
    label "ASREPRoast@ExeFile"
    type "ExeFile"
    nlp "ASREPRoast"
  ]
  node [
    id 13
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 14
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 15
    label "Teaming@APTFamily"
    type "APTFamily"
    nlp "Teaming"
  ]
  edge [
    source 0
    target 1
    action "is"
  ]
  edge [
    source 2
    target 3
    action "supply"
  ]
  edge [
    source 5
    target 6
    action "Used"
  ]
  edge [
    source 7
    target 7
    action "be"
  ]
  edge [
    source 9
    target 10
    action "authenticated"
  ]
  edge [
    source 11
    target 12
    action "tweaked"
  ]
]
