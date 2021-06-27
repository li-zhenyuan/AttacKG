graph [
  directed 1
  node [
    id 0
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 1
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 2
    label "GPO@ExeFile"
    type "ExeFile"
    nlp "GPO"
  ]
  node [
    id 3
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 4
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 5
    label "GUID@ExeFile"
    type "ExeFile"
    nlp "GUID"
  ]
  node [
    id 6
    label "share@ExeFile"
    type "ExeFile"
    nlp "share"
  ]
  node [
    id 7
    label "SYSVOL@ExeFile"
    type "ExeFile"
    nlp "SYSVOL"
  ]
  node [
    id 8
    label "attribute@ExeFile"
    type "ExeFile"
    nlp "attribute"
  ]
  node [
    id 9
    label "ObjectGUID@ExeFile"
    type "ExeFile"
    nlp "ObjectGUID"
  ]
  node [
    id 10
    label "GPMC@ExeFile"
    type "ExeFile"
    nlp "GPMC"
  ]
  node [
    id 11
    label "module@ExeFile"
    type "ExeFile"
    nlp "module"
  ]
  node [
    id 12
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 13
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 14
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 15
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 16
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 17
    label "settings@ExeFile"
    type "ExeFile"
    nlp "settings"
  ]
  node [
    id 18
    label "security@ExeFile"
    type "ExeFile"
    nlp "security"
  ]
  node [
    id 19
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 20
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 21
    label "forest@ExeFile"
    type "ExeFile"
    nlp "forest"
  ]
  node [
    id 22
    label "AD@ExeFile"
    type "ExeFile"
    nlp "AD"
  ]
  node [
    id 23
    label "configuration@ExeFile"
    type "ExeFile"
    nlp "configuration"
  ]
  node [
    id 24
    label "Task@Service"
    type "Service"
    nlp "Task"
  ]
  node [
    id 25
    label "DomainController@ExeFile"
    type "ExeFile"
    nlp "DomainController"
  ]
  node [
    id 26
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 27
    label "Exploiting@Vulnerability"
    type "Vulnerability"
    nlp "Exploiting"
  ]
  node [
    id 28
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 2
    target 2
    action "configured"
  ]
  edge [
    source 2
    target 15
    action "add"
  ]
  edge [
    source 2
    target 23
    action "change"
  ]
  edge [
    source 3
    target 2
    action "are"
  ]
  edge [
    source 5
    target 2
    action "is"
  ]
  edge [
    source 6
    target 7
    action "shared"
  ]
  edge [
    source 8
    target 9
    action "is"
  ]
  edge [
    source 10
    target 11
    action "&#8217;s"
  ]
  edge [
    source 11
    target 0
    action "backup"
  ]
  edge [
    source 12
    target 13
    action "create"
  ]
  edge [
    source 14
    target 0
    action "running"
  ]
  edge [
    source 16
    target 16
    action "hacked"
  ]
  edge [
    source 17
    target 2
    action "-"
  ]
  edge [
    source 19
    target 24
    action "existing"
  ]
  edge [
    source 20
    target 19
    action "Scheduled"
  ]
  edge [
    source 21
    target 22
    action "enabling"
  ]
  edge [
    source 26
    target 27
    action "Building"
  ]
]
