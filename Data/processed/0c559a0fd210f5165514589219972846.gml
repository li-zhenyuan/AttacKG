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
    label "campaign@ExeFile"
    type "ExeFile"
    nlp "campaign"
  ]
  node [
    id 2
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 3
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 4
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 5
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 6
    label "extension@ExeFile"
    type "ExeFile"
    nlp "extension"
  ]
  node [
    id 7
    label "Chrome@ExeFile"
    type "ExeFile"
    nlp "Chrome"
  ]
  node [
    id 8
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 9
    label "land\xe2\x80\x9d.\xc2\xa0The@ExeFile"
    type "ExeFile"
    nlp "land\xe2\x80\x9d.\xc2\xa0The"
  ]
  node [
    id 10
    label "threat@ExeFile"
    type "ExeFile"
    nlp "threat"
  ]
  node [
    id 11
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 12
    label "browser@ExeFile"
    type "ExeFile"
    nlp "browser"
  ]
  node [
    id 13
    label "extensions@ExeFile"
    type "ExeFile"
    nlp "extensions"
  ]
  node [
    id 14
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 15
    label "JavaScript@ExeFile"
    type "ExeFile"
    nlp "JavaScript"
  ]
  node [
    id 16
    label "jQuery@ExeFile"
    type "ExeFile"
    nlp "jQuery"
  ]
  node [
    id 17
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 18
    label "actor\xe2\x80\x99s@APTFamily"
    type "APTFamily"
    nlp "actor\xe2\x80\x99s"
  ]
  node [
    id 19
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 20
    label "information@ExeFile"
    type "ExeFile"
    nlp "information"
  ]
  node [
    id 21
    label "Registrant@ExeFile"
    type "ExeFile"
    nlp "Registrant"
  ]
  node [
    id 22
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 23
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 24
    label "batch@ExeFile"
    type "ExeFile"
    nlp "batch"
  ]
  node [
    id 25
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 26
    label "exploitationNirsoft@Vulnerability"
    type "Vulnerability"
    nlp "exploitationNirsoft"
  ]
  edge [
    source 1
    target 2
    action "is"
  ]
  edge [
    source 3
    target 4
    action "scavenging"
  ]
  edge [
    source 3
    target 8
    action "built"
  ]
  edge [
    source 3
    target 20
    action "allowed"
  ]
  edge [
    source 6
    target 7
    action "focused"
  ]
  edge [
    source 7
    target 19
    action "was"
  ]
  edge [
    source 7
    target 6
    action "left"
  ]
  edge [
    source 8
    target 9
    action "built"
  ]
  edge [
    source 9
    target 10
    action "built"
  ]
  edge [
    source 10
    target 11
    action "access\xc2\xa0compromised"
  ]
  edge [
    source 12
    target 7
    action "prevented"
  ]
  edge [
    source 13
    target 7
    action "read"
  ]
  edge [
    source 14
    target 15
    action "is"
  ]
  edge [
    source 14
    target 16
    action "retrieving"
  ]
  edge [
    source 14
    target 24
    action "saved"
  ]
  edge [
    source 18
    target 13
    action "included"
  ]
  edge [
    source 20
    target 21
    action "allowed"
  ]
  edge [
    source 22
    target 8
    action "compromised"
  ]
  edge [
    source 23
    target 14
    action "dump"
  ]
  edge [
    source 24
    target 25
    action "dump"
  ]
  edge [
    source 25
    target 26
    action "dump"
  ]
]
