graph [
  directed 1
  node [
    id 0
    label "Google@ExeFile"
    type "ExeFile"
    nlp "Google"
  ]
  node [
    id 1
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "attachment@DocumentFile"
    type "DocumentFile"
    nlp "attachment"
  ]
  node [
    id 4
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 5
    label "attacker@ExeFile"
    type "ExeFile"
    nlp "attacker"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 8
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 9
    label "factors@APTFamily"
    type "APTFamily"
    nlp "factors"
  ]
  node [
    id 10
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 11
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 12
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 13
    label "Exploit.266@Vulnerability"
    type "Vulnerability"
    nlp "Exploit.266"
  ]
  node [
    id 14
    label "support@ExeFile"
    type "ExeFile"
    nlp "support"
  ]
  node [
    id 15
    label "Multimedia@ExeFile"
    type "ExeFile"
    nlp "Multimedia"
  ]
  node [
    id 16
    label "attachments@DocumentFile"
    type "DocumentFile"
    nlp "attachments"
  ]
  node [
    id 17
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  edge [
    source 2
    target 3
    action "launching"
  ]
  edge [
    source 8
    target 8
    action "was"
  ]
  edge [
    source 10
    target 11
    action "used"
  ]
  edge [
    source 10
    target 16
    action "containing"
  ]
]
