graph [
  directed 1
  node [
    id 0
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 1
    label "security@ExeFile"
    type "ExeFile"
    nlp "security"
  ]
  node [
    id 2
    label "UAC@ExeFile"
    type "ExeFile"
    nlp "UAC"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 5
    label "document\r@DocumentFile"
    type "DocumentFile"
    nlp "document\r"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "permission@ExeFile"
    type "ExeFile"
    nlp "permission"
  ]
  node [
    id 8
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 9
    label "Command:\r@ExeFile"
    type "ExeFile"
    nlp "Command:\r"
  ]
  node [
    id 10
    label "HKCU\\Software\\Classes\\mscfile\\shell\\open\\command\\\r@ExeFile"
    type "ExeFile"
    nlp "HKCU\\Software\\Classes\\mscfile\\shell\\open\\command\\\r"
  ]
  node [
    id 11
    label "HKCU\\Software\\Classes\\mscfile\\shell\\open\\command@ExeFile"
    type "ExeFile"
    nlp "HKCU\\Software\\Classes\\mscfile\\shell\\open\\command"
  ]
  node [
    id 12
    label "HKCU\\Software\\Classes\\mscfile\\shell\\open\\command\\@ExeFile"
    type "ExeFile"
    nlp "HKCU\\Software\\Classes\\mscfile\\shell\\open\\command\\"
  ]
  node [
    id 13
    label "HKCR\\mscfile\\shell\\open\\command\\@ExeFile"
    type "ExeFile"
    nlp "HKCR\\mscfile\\shell\\open\\command\\"
  ]
  node [
    id 14
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 15
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 16
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 17
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  edge [
    source 0
    target 1
    action "bypass"
  ]
  edge [
    source 0
    target 4
    action "is"
  ]
  edge [
    source 0
    target 3
    action "execute"
  ]
  edge [
    source 1
    target 2
    action "execute"
  ]
  edge [
    source 2
    target 3
    action "stealing"
  ]
  edge [
    source 2
    target 7
    action "popping"
  ]
  edge [
    source 3
    target 3
    action "executed"
  ]
  edge [
    source 3
    target 6
    action "executes"
  ]
  edge [
    source 11
    target 9
    action "add"
  ]
  edge [
    source 12
    target 13
    action "querying"
  ]
  edge [
    source 15
    target 16
    action "Be"
  ]
]
