graph [
  directed 1
  node [
    id 0
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 1
    label "Documentation@DocumentFile"
    type "DocumentFile"
    nlp "Documentation"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 4
    label "attacks@ExeFile"
    type "ExeFile"
    nlp "attacks"
  ]
  node [
    id 5
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 6
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 7
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 8
    label "CnC@ExeFile"
    type "ExeFile"
    nlp "CnC"
  ]
  node [
    id 9
    label "certificate@ExeFile"
    type "ExeFile"
    nlp "certificate"
  ]
  node [
    id 10
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 11
    label "samples@ExeFile"
    type "ExeFile"
    nlp "samples"
  ]
  node [
    id 12
    label "XtremeRat@ExeFile"
    type "ExeFile"
    nlp "XtremeRat"
  ]
  node [
    id 13
    label "C:\\Documents@DocumentFile"
    type "DocumentFile"
    nlp "C:\\Documents"
  ]
  node [
    id 14
    label "infrastructure@ExeFile"
    type "ExeFile"
    nlp "infrastructure"
  ]
  node [
    id 15
    label "address@ExeFile"
    type "ExeFile"
    nlp "address"
  ]
  node [
    id 16
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 17
    label "sample@ExeFile"
    type "ExeFile"
    nlp "sample"
  ]
  node [
    id 18
    label "PIVY@ExeFile"
    type "ExeFile"
    nlp "PIVY"
  ]
  node [
    id 19
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 20
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 21
    label "transcript@ExeFile"
    type "ExeFile"
    nlp "transcript"
  ]
  node [
    id 22
    label "Ramadan.rar@ExeFile"
    type "ExeFile"
    nlp "Ramadan.rar"
  ]
  node [
    id 23
    label "Dropbox@ExeFile"
    type "ExeFile"
    nlp "Dropbox"
  ]
  node [
    id 24
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 25
    label "Commander@ExeFile"
    type "ExeFile"
    nlp "Commander"
  ]
  node [
    id 26
    label "attacker@ExeFile"
    type "ExeFile"
    nlp "attacker"
  ]
  node [
    id 27
    label "Molerats@ExeFile"
    type "ExeFile"
    nlp "Molerats"
  ]
  node [
    id 28
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 29
    label "RAR@ExeFile"
    type "ExeFile"
    nlp "RAR"
  ]
  node [
    id 30
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 31
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 32
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 33
    label "domain@ExeFile"
    type "ExeFile"
    nlp "domain"
  ]
  node [
    id 34
    label "addresses@ExeFile"
    type "ExeFile"
    nlp "addresses"
  ]
  node [
    id 35
    label "domains@ExeFile"
    type "ExeFile"
    nlp "domains"
  ]
  node [
    id 36
    label "data@ExeFile"
    type "ExeFile"
    nlp "data"
  ]
  node [
    id 37
    label "resolution@ExeFile"
    type "ExeFile"
    nlp "resolution"
  ]
  node [
    id 38
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 39
    label "group@ExeFile"
    type "ExeFile"
    nlp "group"
  ]
  node [
    id 40
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 41
    label "actor\xe2\x80\x9d@APTFamily"
    type "APTFamily"
    nlp "actor\xe2\x80\x9d"
  ]
  node [
    id 42
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 43
    label "Documents@DocumentFile"
    type "DocumentFile"
    nlp "Documents"
  ]
  edge [
    source 2
    target 9
    action "was"
  ]
  edge [
    source 3
    target 3
    action "used"
  ]
  edge [
    source 3
    target 2
    action "based"
  ]
  edge [
    source 3
    target 5
    action "associated"
  ]
  edge [
    source 4
    target 3
    action "associated"
  ]
  edge [
    source 4
    target 12
    action "was"
  ]
  edge [
    source 6
    target 7
    action "connected"
  ]
  edge [
    source 6
    target 4
    action "was"
  ]
  edge [
    source 7
    target 8
    action "connected"
  ]
  edge [
    source 8
    target 16
    action "linked"
  ]
  edge [
    source 8
    target 33
    action "be"
  ]
  edge [
    source 9
    target 10
    action "forged"
  ]
  edge [
    source 10
    target 11
    action "forged"
  ]
  edge [
    source 11
    target 12
    action "forged"
  ]
  edge [
    source 14
    target 15
    action "linked"
  ]
  edge [
    source 15
    target 8
    action "linked"
  ]
  edge [
    source 15
    target 16
    action "shifted"
  ]
  edge [
    source 16
    target 35
    action "resolve"
  ]
  edge [
    source 17
    target 18
    action "found"
  ]
  edge [
    source 19
    target 8
    action "communicated"
  ]
  edge [
    source 20
    target 21
    action "included"
  ]
  edge [
    source 20
    target 25
    action "contained"
  ]
  edge [
    source 22
    target 23
    action "labeled"
  ]
  edge [
    source 23
    target 24
    action "sharing"
  ]
  edge [
    source 26
    target 27
    action "uses"
  ]
  edge [
    source 27
    target 28
    action "deliver"
  ]
  edge [
    source 28
    target 29
    action "include"
  ]
  edge [
    source 29
    target 30
    action "containing"
  ]
  edge [
    source 31
    target 32
    action "sends"
  ]
  edge [
    source 32
    target 28
    action "include"
  ]
  edge [
    source 33
    target 34
    action "be"
  ]
  edge [
    source 34
    target 16
    action "be"
  ]
  edge [
    source 35
    target 8
    action "resolve"
  ]
  edge [
    source 36
    target 37
    action "occurred"
  ]
  edge [
    source 37
    target 38
    action "occurred"
  ]
  edge [
    source 38
    target 38
    action "collected"
  ]
  edge [
    source 39
    target 27
    action "focused"
  ]
  edge [
    source 40
    target 41
    action "used"
  ]
]
