graph [
  directed 1
  node [
    id 0
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 1
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  node [
    id 2
    label "Exploits@Vulnerability"
    type "Vulnerability"
    nlp "Exploits"
  ]
  node [
    id 3
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 4
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 5
    label "Actors@APTFamily"
    type "APTFamily"
    nlp "Actors"
  ]
  node [
    id 6
    label "MuddyWater@ExeFile"
    type "ExeFile"
    nlp "MuddyWater"
  ]
  node [
    id 7
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 8
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 9
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 10
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 11
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 12
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 13
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 14
    label "code@ExeFile"
    type "ExeFile"
    nlp "code"
  ]
  node [
    id 15
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 16
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 17
    label "number@ExeFile"
    type "ExeFile"
    nlp "number"
  ]
  node [
    id 18
    label "GUID@ExeFile"
    type "ExeFile"
    nlp "GUID"
  ]
  node [
    id 19
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 20
    label "process@ExeFile"
    type "ExeFile"
    nlp "process"
  ]
  node [
    id 21
    label "Powershell.exe@ExeFile"
    type "ExeFile"
    nlp "Powershell.exe"
  ]
  node [
    id 22
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 23
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 24
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 25
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 26
    label "threat@ExeFile"
    type "ExeFile"
    nlp "threat"
  ]
  node [
    id 27
    label "Document@DocumentFile"
    type "DocumentFile"
    nlp "Document"
  ]
  node [
    id 28
    label "DOWNLOAD@ExeFile"
    type "ExeFile"
    nlp "DOWNLOAD"
  ]
  node [
    id 29
    label "UPLOAD@ExeFile"
    type "ExeFile"
    nlp "UPLOAD"
  ]
  node [
    id 30
    label "functions@ExeFile"
    type "ExeFile"
    nlp "functions"
  ]
  node [
    id 31
    label "RUN@ExeFile"
    type "ExeFile"
    nlp "RUN"
  ]
  node [
    id 32
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 33
    label "INTI@ExeFile"
    type "ExeFile"
    nlp "INTI"
  ]
  node [
    id 34
    label "SubscriptionSubscribe@ExeFile"
    type "ExeFile"
    nlp "SubscriptionSubscribe"
  ]
  node [
    id 35
    label "UpdatedEmail@NetLoc"
    type "NetLoc"
    nlp "UpdatedEmail"
  ]
  edge [
    source 3
    target 4
    action "known"
  ]
  edge [
    source 4
    target 11
    action "detected"
  ]
  edge [
    source 4
    target 6
    action "keep"
  ]
  edge [
    source 5
    target 6
    action "detailed"
  ]
  edge [
    source 6
    target 7
    action "Uncovered"
  ]
  edge [
    source 6
    target 26
    action "keep"
  ]
  edge [
    source 7
    target 18
    action "named"
  ]
  edge [
    source 7
    target 14
    action "is"
  ]
  edge [
    source 7
    target 19
    action "download"
  ]
  edge [
    source 9
    target 12
    action "encoded"
  ]
  edge [
    source 9
    target 9
    action "using"
  ]
  edge [
    source 10
    target 9
    action "showing"
  ]
  edge [
    source 13
    target 11
    action "executing"
  ]
  edge [
    source 14
    target 11
    action "executes"
  ]
  edge [
    source 15
    target 16
    action "be"
  ]
  edge [
    source 15
    target 15
    action "upload"
  ]
  edge [
    source 15
    target 19
    action "upload"
  ]
  edge [
    source 16
    target 22
    action "named"
  ]
  edge [
    source 16
    target 20
    action "executing"
  ]
  edge [
    source 17
    target 18
    action "generate"
  ]
  edge [
    source 18
    target 19
    action "named"
  ]
  edge [
    source 19
    target 16
    action "upload"
  ]
  edge [
    source 20
    target 21
    action "executing"
  ]
  edge [
    source 22
    target 23
    action "downloaded"
  ]
  edge [
    source 22
    target 18
    action "named"
  ]
  edge [
    source 25
    target 15
    action "hardcoded"
  ]
  edge [
    source 28
    target 29
    action "supports"
  ]
  edge [
    source 29
    target 30
    action "supports"
  ]
  edge [
    source 30
    target 31
    action "supports"
  ]
  edge [
    source 34
    target 35
    action "\r"
  ]
]
