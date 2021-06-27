graph [
  directed 1
  node [
    id 0
    label "\xe2\x80\x93@ExeFile"
    type "ExeFile"
    nlp "\xe2\x80\x93"
  ]
  node [
    id 1
    label "Industroyer@ExeFile"
    type "ExeFile"
    nlp "Industroyer"
  ]
  node [
    id 2
    label "security@ExeFile"
    type "ExeFile"
    nlp "security"
  ]
  node [
    id 3
    label "TeleBots@ExeFile"
    type "ExeFile"
    nlp "TeleBots"
  ]
  node [
    id 4
    label "NotPetya@ExeFile"
    type "ExeFile"
    nlp "NotPetya"
  ]
  node [
    id 5
    label "ransomware@ExeFile"
    type "ExeFile"
    nlp "ransomware"
  ]
  node [
    id 6
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 7
    label "BlackEnergy@ExeFile"
    type "ExeFile"
    nlp "BlackEnergy"
  ]
  node [
    id 8
    label "attacks@ExeFile"
    type "ExeFile"
    nlp "attacks"
  ]
  node [
    id 9
    label "group@ExeFile"
    type "ExeFile"
    nlp "group"
  ]
  node [
    id 10
    label "backdoor@ExeFile"
    type "ExeFile"
    nlp "backdoor"
  ]
  node [
    id 11
    label "service@ExeFile"
    type "ExeFile"
    nlp "service"
  ]
  node [
    id 12
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 13
    label "system@ExeFile"
    type "ExeFile"
    nlp "system"
  ]
  node [
    id 14
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 15
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 16
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 17
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 18
    label "AV@ExeFile"
    type "ExeFile"
    nlp "AV"
  ]
  node [
    id 19
    label "servers@ExeFile"
    type "ExeFile"
    nlp "servers"
  ]
  node [
    id 20
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 21
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 22
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 23
    label "Upload@ExeFile"
    type "ExeFile"
    nlp "Upload"
  ]
  node [
    id 24
    label "stealer@ExeFile"
    type "ExeFile"
    nlp "stealer"
  ]
  node [
    id 25
    label "password@ExeFile"
    type "ExeFile"
    nlp "password"
  ]
  node [
    id 26
    label "clients@ExeFile"
    type "ExeFile"
    nlp "clients"
  ]
  node [
    id 27
    label "FTP@ExeFile"
    type "ExeFile"
    nlp "FTP"
  ]
  node [
    id 28
    label "Commander@ExeFile"
    type "ExeFile"
    nlp "Commander"
  ]
  node [
    id 29
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 30
    label "CommandPurpose@ExeFile"
    type "ExeFile"
    nlp "CommandPurpose"
  ]
  node [
    id 31
    label "UpdateUpdates@ExeFile"
    type "ExeFile"
    nlp "UpdateUpdates"
  ]
  node [
    id 32
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 33
    label "Win32@ExeFile"
    type "ExeFile"
    nlp "Win32"
  ]
  node [
    id 34
    label "network@ExeFile"
    type "ExeFile"
    nlp "network"
  ]
  node [
    id 35
    label "Tor@ExeFile"
    type "ExeFile"
    nlp "Tor"
  ]
  node [
    id 36
    label "addresses@ExeFile"
    type "ExeFile"
    nlp "addresses"
  ]
  node [
    id 37
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 38
    label "KillDisk@ExeFile"
    type "ExeFile"
    nlp "KillDisk"
  ]
  edge [
    source 0
    target 1
    action "resulted"
  ]
  edge [
    source 1
    target 2
    action "linking"
  ]
  edge [
    source 1
    target 4
    action "induced"
  ]
  edge [
    source 2
    target 3
    action "used"
  ]
  edge [
    source 3
    target 7
    action "linking"
  ]
  edge [
    source 4
    target 5
    action "induced"
  ]
  edge [
    source 5
    target 6
    action "used"
  ]
  edge [
    source 6
    target 3
    action "used"
  ]
  edge [
    source 6
    target 7
    action "happened"
  ]
  edge [
    source 6
    target 21
    action "resulting"
  ]
  edge [
    source 7
    target 6
    action "happened"
  ]
  edge [
    source 7
    target 3
    action "documented"
  ]
  edge [
    source 8
    target 9
    action "documented"
  ]
  edge [
    source 9
    target 7
    action "documented"
  ]
  edge [
    source 9
    target 3
    action "keep"
  ]
  edge [
    source 10
    target 3
    action "uses"
  ]
  edge [
    source 11
    target 12
    action "starts"
  ]
  edge [
    source 12
    target 13
    action "named"
  ]
  edge [
    source 12
    target 14
    action "named"
  ]
  edge [
    source 13
    target 12
    action "named"
  ]
  edge [
    source 15
    target 12
    action "writes"
  ]
  edge [
    source 16
    target 17
    action "servers"
  ]
  edge [
    source 16
    target 20
    action "hardcoded"
  ]
  edge [
    source 17
    target 22
    action "specified"
  ]
  edge [
    source 17
    target 23
    action "specified"
  ]
  edge [
    source 17
    target 21
    action "found"
  ]
  edge [
    source 19
    target 16
    action "uses"
  ]
  edge [
    source 20
    target 21
    action "is"
  ]
  edge [
    source 20
    target 16
    action "SetTimeoutSets"
  ]
  edge [
    source 21
    target 16
    action "executed"
  ]
  edge [
    source 21
    target 30
    action "following"
  ]
  edge [
    source 22
    target 17
    action "specified"
  ]
  edge [
    source 24
    target 25
    action "including"
  ]
  edge [
    source 26
    target 27
    action "saved"
  ]
  edge [
    source 29
    target 29
    action "collect"
  ]
  edge [
    source 34
    target 35
    action "were"
  ]
  edge [
    source 35
    target 36
    action "means"
  ]
  edge [
    source 36
    target 37
    action "result"
  ]
]
