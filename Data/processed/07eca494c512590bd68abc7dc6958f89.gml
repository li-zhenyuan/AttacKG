graph [
  directed 1
  node [
    id 0
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 1
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 2
    label "documentKey@DocumentFile"
    type "DocumentFile"
    nlp "documentKey"
  ]
  node [
    id 3
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 4
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 5
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 6
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 7
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 8
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
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
    label "infrastructure@ExeFile"
    type "ExeFile"
    nlp "infrastructure"
  ]
  node [
    id 12
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 13
    label "address@ExeFile"
    type "ExeFile"
    nlp "address"
  ]
  node [
    id 14
    label "Team\xe2\x80\x99s@APTFamily"
    type "APTFamily"
    nlp "Team\xe2\x80\x99s"
  ]
  node [
    id 15
    label "report@ExeFile"
    type "ExeFile"
    nlp "report"
  ]
  node [
    id 16
    label "Grass\xe2\x80\x9d@ExeFile"
    type "ExeFile"
    nlp "Grass\xe2\x80\x9d"
  ]
  node [
    id 17
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 18
    label "XLS@ExeFile"
    type "ExeFile"
    nlp "XLS"
  ]
  node [
    id 19
    label "C:\\Users\\donot\\Documents\\Visual@DocumentFile"
    type "DocumentFile"
    nlp "C:\\Users\\donot\\Documents\\Visual"
  ]
  node [
    id 20
    label "path@ExeFile"
    type "ExeFile"
    nlp "path"
  ]
  node [
    id 21
    label "PDB@ExeFile"
    type "ExeFile"
    nlp "PDB"
  ]
  node [
    id 22
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 23
    label "check@ExeFile"
    type "ExeFile"
    nlp "check"
  ]
  node [
    id 24
    label "VMWare@ExeFile"
    type "ExeFile"
    nlp "VMWare"
  ]
  node [
    id 25
    label "logCommand@ExeFile"
    type "ExeFile"
    nlp "logCommand"
  ]
  node [
    id 26
    label "host@ExeFile"
    type "ExeFile"
    nlp "host"
  ]
  node [
    id 27
    label "Vilfi[email@NetLoc"
    type "NetLoc"
    nlp "Vilfi[email"
  ]
  node [
    id 28
    label "taskname@Service"
    type "Service"
    nlp "taskname"
  ]
  node [
    id 29
    label "schtasks@Service"
    type "Service"
    nlp "schtasks"
  ]
  node [
    id 30
    label "download@ExeFile"
    type "ExeFile"
    nlp "download"
  ]
  node [
    id 31
    label "id\xe2\x80\x9d@ExeFile"
    type "ExeFile"
    nlp "id\xe2\x80\x9d"
  ]
  node [
    id 32
    label "\xe2\x80\x9cbot@ExeFile"
    type "ExeFile"
    nlp "\xe2\x80\x9cbot"
  ]
  node [
    id 33
    label "URI@ExeFile"
    type "ExeFile"
    nlp "URI"
  ]
  node [
    id 34
    label "parameters@ExeFile"
    type "ExeFile"
    nlp "parameters"
  ]
  node [
    id 35
    label "POST@ExeFile"
    type "ExeFile"
    nlp "POST"
  ]
  node [
    id 36
    label "functionality@ExeFile"
    type "ExeFile"
    nlp "functionality"
  ]
  node [
    id 37
    label "commandOutput@ExeFile"
    type "ExeFile"
    nlp "commandOutput"
  ]
  node [
    id 38
    label "tasklist@Service"
    type "Service"
    nlp "tasklist"
  ]
  edge [
    source 0
    target 1
    action "targeting"
  ]
  edge [
    source 0
    target 10
    action "using"
  ]
  edge [
    source 0
    target 13
    action "communicated"
  ]
  edge [
    source 1
    target 2
    action "focuses"
  ]
  edge [
    source 1
    target 1
    action "reported"
  ]
  edge [
    source 1
    target 15
    action "known"
  ]
  edge [
    source 1
    target 0
    action "based"
  ]
  edge [
    source 1
    target 28
    action "use"
  ]
  edge [
    source 1
    target 30
    action "seen"
  ]
  edge [
    source 3
    target 0
    action "created"
  ]
  edge [
    source 3
    target 1
    action "are"
  ]
  edge [
    source 4
    target 0
    action "is"
  ]
  edge [
    source 5
    target 1
    action "spread"
  ]
  edge [
    source 6
    target 7
    action "stored"
  ]
  edge [
    source 7
    target 7
    action "following"
  ]
  edge [
    source 7
    target 17
    action "seen"
  ]
  edge [
    source 7
    target 10
    action "is"
  ]
  edge [
    source 7
    target 27
    action "following"
  ]
  edge [
    source 7
    target 26
    action "contained"
  ]
  edge [
    source 8
    target 9
    action "start"
  ]
  edge [
    source 9
    target 0
    action "start"
  ]
  edge [
    source 9
    target 10
    action "beaconing"
  ]
  edge [
    source 10
    target 7
    action "is"
  ]
  edge [
    source 11
    target 12
    action "shared"
  ]
  edge [
    source 12
    target 1
    action "discovered"
  ]
  edge [
    source 13
    target 12
    action "subdomains.\xc2\xa0"
  ]
  edge [
    source 14
    target 1
    action "appeared"
  ]
  edge [
    source 15
    target 16
    action "known"
  ]
  edge [
    source 17
    target 18
    action "seen"
  ]
  edge [
    source 20
    target 21
    action "executes"
  ]
  edge [
    source 20
    target 29
    action "using"
  ]
  edge [
    source 20
    target 33
    action "was"
  ]
  edge [
    source 21
    target 1
    action "seen"
  ]
  edge [
    source 22
    target 1
    action "execute"
  ]
  edge [
    source 23
    target 24
    action "has"
  ]
  edge [
    source 26
    target 10
    action "following"
  ]
  edge [
    source 28
    target 20
    action "using"
  ]
  edge [
    source 29
    target 21
    action "establishes"
  ]
  edge [
    source 31
    target 32
    action "C:\\Users\\803\\Desktop\\ytyboth\\yty"
  ]
  edge [
    source 32
    target 0
    action "used"
  ]
  edge [
    source 34
    target 35
    action "hardcoded"
  ]
  edge [
    source 36
    target 10
    action "send"
  ]
  edge [
    source 37
    target 37
    action "is"
  ]
  edge [
    source 37
    target 38
    action "appended"
  ]
]
