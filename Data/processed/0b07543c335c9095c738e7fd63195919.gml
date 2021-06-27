graph [
  directed 1
  node [
    id 0
    label "Actor@APTFamily"
    type "APTFamily"
    nlp "Actor"
  ]
  node [
    id 1
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 2
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "version@ExeFile"
    type "ExeFile"
    nlp "version"
  ]
  node [
    id 5
    label "PDF@ExeFile"
    type "ExeFile"
    nlp "PDF"
  ]
  node [
    id 6
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 7
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 8
    label "RAR@ExeFile"
    type "ExeFile"
    nlp "RAR"
  ]
  node [
    id 9
    label "documents\xe2\x80\x99@DocumentFile"
    type "DocumentFile"
    nlp "documents\xe2\x80\x99"
  ]
  node [
    id 10
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 11
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 12
    label "analysts@ExeFile"
    type "ExeFile"
    nlp "analysts"
  ]
  node [
    id 13
    label "CISA@ExeFile"
    type "ExeFile"
    nlp "CISA"
  ]
  node [
    id 14
    label "actors\xe2\x80\x99@APTFamily"
    type "APTFamily"
    nlp "actors\xe2\x80\x99"
  ]
  node [
    id 15
    label "database@ExeFile"
    type "ExeFile"
    nlp "database"
  ]
  node [
    id 16
    label "CVE@ExeFile"
    type "ExeFile"
    nlp "CVE"
  ]
  node [
    id 17
    label "NVD@ExeFile"
    type "ExeFile"
    nlp "NVD"
  ]
  node [
    id 18
    label "information@ExeFile"
    type "ExeFile"
    nlp "information"
  ]
  node [
    id 19
    label "NCPS@ExeFile"
    type "ExeFile"
    nlp "NCPS"
  ]
  node [
    id 20
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 21
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 22
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 23
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 24
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 25
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 26
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 27
    label "Strike@ExeFile"
    type "ExeFile"
    nlp "Strike"
  ]
  node [
    id 28
    label "Cobalt@ExeFile"
    type "ExeFile"
    nlp "Cobalt"
  ]
  node [
    id 29
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 30
    label "actor\xe2\x80\x99s@APTFamily"
    type "APTFamily"
    nlp "actor\xe2\x80\x99s"
  ]
  node [
    id 31
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 32
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 33
    label "Execution@ExeFile"
    type "ExeFile"
    nlp "Execution"
  ]
  node [
    id 34
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 35
    label "Collection@ExeFile"
    type "ExeFile"
    nlp "Collection"
  ]
  node [
    id 36
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 37
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 38
    label "addresses@ExeFile"
    type "ExeFile"
    nlp "addresses"
  ]
  node [
    id 39
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 40
    label "Actors@APTFamily"
    type "APTFamily"
    nlp "Actors"
  ]
  node [
    id 41
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  edge [
    source 0
    target 41
    action "Continued"
  ]
  edge [
    source 1
    target 2
    action "using"
  ]
  edge [
    source 1
    target 3
    action "develop"
  ]
  edge [
    source 1
    target 1
    action "are"
  ]
  edge [
    source 1
    target 6
    action "accomplish"
  ]
  edge [
    source 1
    target 13
    action "have"
  ]
  edge [
    source 1
    target 15
    action "rely"
  ]
  edge [
    source 1
    target 21
    action "execute"
  ]
  edge [
    source 1
    target 23
    action "have"
  ]
  edge [
    source 1
    target 24
    action "using"
  ]
  edge [
    source 1
    target 25
    action "leveraging"
  ]
  edge [
    source 1
    target 27
    action "using"
  ]
  edge [
    source 1
    target 31
    action "use"
  ]
  edge [
    source 1
    target 32
    action "mentioned"
  ]
  edge [
    source 1
    target 33
    action "identified"
  ]
  edge [
    source 1
    target 22
    action "dump"
  ]
  edge [
    source 1
    target 34
    action "highlighted"
  ]
  edge [
    source 1
    target 35
    action "listed"
  ]
  edge [
    source 1
    target 36
    action "collect"
  ]
  edge [
    source 1
    target 37
    action "listed"
  ]
  edge [
    source 3
    target 2
    action "use"
  ]
  edge [
    source 4
    target 5
    action "Click"
  ]
  edge [
    source 6
    target 15
    action "enrich"
  ]
  edge [
    source 6
    target 30
    action "complement"
  ]
  edge [
    source 7
    target 8
    action "packaged"
  ]
  edge [
    source 8
    target 9
    action "packaged"
  ]
  edge [
    source 9
    target 10
    action "encrypted"
  ]
  edge [
    source 10
    target 11
    action "encrypted"
  ]
  edge [
    source 11
    target 8
    action "encrypted"
  ]
  edge [
    source 12
    target 1
    action "have"
  ]
  edge [
    source 12
    target 13
    action "identified"
  ]
  edge [
    source 13
    target 1
    action "was"
  ]
  edge [
    source 13
    target 22
    action "compromised"
  ]
  edge [
    source 15
    target 16
    action "rely"
  ]
  edge [
    source 15
    target 18
    action "enrich"
  ]
  edge [
    source 16
    target 17
    action "contain"
  ]
  edge [
    source 16
    target 19
    action "enrich"
  ]
  edge [
    source 17
    target 1
    action "remain"
  ]
  edge [
    source 18
    target 16
    action "enrich"
  ]
  edge [
    source 23
    target 31
    action "weaponized"
  ]
  edge [
    source 25
    target 2
    action "compromise"
  ]
  edge [
    source 26
    target 1
    action "used"
  ]
  edge [
    source 27
    target 28
    action "servers"
  ]
  edge [
    source 29
    target 27
    action "servers"
  ]
  edge [
    source 31
    target 20
    action "owned"
  ]
  edge [
    source 31
    target 1
    action "sent"
  ]
  edge [
    source 32
    target 6
    action "existing"
  ]
  edge [
    source 34
    target 1
    action "observed"
  ]
  edge [
    source 36
    target 31
    action "targeting"
  ]
  edge [
    source 41
    target 0
    action "Exploited"
  ]
  edge [
    source 41
    target 25
    action "Continued"
  ]
]
