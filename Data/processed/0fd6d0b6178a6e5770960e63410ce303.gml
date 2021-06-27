graph [
  directed 1
  node [
    id 0
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 1
    label "systems@ExeFile"
    type "ExeFile"
    nlp "systems"
  ]
  node [
    id 2
    label "SCADA@ExeFile"
    type "ExeFile"
    nlp "SCADA"
  ]
  node [
    id 3
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 4
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 5
    label "sector@ExeFile"
    type "ExeFile"
    nlp "sector"
  ]
  node [
    id 6
    label "FTP@ExeFile"
    type "ExeFile"
    nlp "FTP"
  ]
  node [
    id 7
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 8
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 9
    label "Document@DocumentFile"
    type "DocumentFile"
    nlp "Document"
  ]
  node [
    id 10
    label "COVID-19@ExeFile"
    type "ExeFile"
    nlp "COVID-19"
  ]
  node [
    id 11
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 12
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 13
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 14
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 15
    label "License.txt@ExeFile"
    type "ExeFile"
    nlp "License.txt"
  ]
  node [
    id 16
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 17
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 18
    label "usage@ExeFile"
    type "ExeFile"
    nlp "usage"
  ]
  node [
    id 19
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 20
    label "C2@ExeFile"
    type "ExeFile"
    nlp "C2"
  ]
  node [
    id 21
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 22
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 23
    label "hive@ExeFile"
    type "ExeFile"
    nlp "hive"
  ]
  node [
    id 24
    label "RUN@ExeFile"
    type "ExeFile"
    nlp "RUN"
  ]
  node [
    id 25
    label "Commands@ExeFile"
    type "ExeFile"
    nlp "Commands"
  ]
  node [
    id 26
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 27
    label "FileSize@ExeFile"
    type "ExeFile"
    nlp "FileSize"
  ]
  node [
    id 28
    label "EmailUser@NetLoc"
    type "NetLoc"
    nlp "EmailUser"
  ]
  node [
    id 29
    label "EmailPass@NetLoc"
    type "NetLoc"
    nlp "EmailPass"
  ]
  node [
    id 30
    label "Documents/@DocumentFile"
    type "DocumentFile"
    nlp "Documents/"
  ]
  node [
    id 31
    label "parameters@ExeFile"
    type "ExeFile"
    nlp "parameters"
  ]
  node [
    id 32
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 33
    label "AMP@ExeFile"
    type "ExeFile"
    nlp "AMP"
  ]
  node [
    id 34
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 35
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 36
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 37
    label "SIG@ExeFile"
    type "ExeFile"
    nlp "SIG"
  ]
  edge [
    source 0
    target 1
    action "identified"
  ]
  edge [
    source 0
    target 3
    action "uses"
  ]
  edge [
    source 1
    target 2
    action "be"
  ]
  edge [
    source 3
    target 4
    action "drop"
  ]
  edge [
    source 4
    target 5
    action "including"
  ]
  edge [
    source 4
    target 15
    action "deleting"
  ]
  edge [
    source 4
    target 8
    action "depending"
  ]
  edge [
    source 4
    target 13
    action "used"
  ]
  edge [
    source 5
    target 2
    action "including"
  ]
  edge [
    source 6
    target 20
    action "are"
  ]
  edge [
    source 7
    target 4
    action "extract"
  ]
  edge [
    source 7
    target 7
    action "written"
  ]
  edge [
    source 8
    target 6
    action "depending"
  ]
  edge [
    source 8
    target 29
    action "define"
  ]
  edge [
    source 11
    target 18
    action "are"
  ]
  edge [
    source 13
    target 7
    action "appended"
  ]
  edge [
    source 14
    target 4
    action "deleting"
  ]
  edge [
    source 14
    target 25
    action "written"
  ]
  edge [
    source 18
    target 19
    action "are"
  ]
  edge [
    source 19
    target 6
    action "are"
  ]
  edge [
    source 21
    target 22
    action "provide"
  ]
  edge [
    source 22
    target 23
    action "adding"
  ]
  edge [
    source 23
    target 24
    action "adding"
  ]
  edge [
    source 24
    target 12
    action "execute"
  ]
  edge [
    source 27
    target 28
    action "password1"
  ]
  edge [
    source 28
    target 29
    action "password1"
  ]
  edge [
    source 28
    target 8
    action "define"
  ]
  edge [
    source 29
    target 30
    action "password1"
  ]
  edge [
    source 31
    target 6
    action "define"
  ]
  edge [
    source 33
    target 4
    action "prevent"
  ]
  edge [
    source 35
    target 36
    action "block"
  ]
  edge [
    source 36
    target 13
    action "sent"
  ]
]
