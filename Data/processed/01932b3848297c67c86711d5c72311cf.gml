graph [
  directed 1
  node [
    id 0
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 1
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 2
    label "MSI@ExeFile"
    type "ExeFile"
    nlp "MSI"
  ]
  node [
    id 3
    label "RTF@ExeFile"
    type "ExeFile"
    nlp "RTF"
  ]
  node [
    id 4
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 5
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 6
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 7
    label "script>\r@ExeFile"
    type "ExeFile"
    nlp "script>\r"
  ]
  node [
    id 8
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 9
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 10
    label "Tasks.png@Service"
    type "Service"
    nlp "Tasks.png"
  ]
  node [
    id 11
    label "/script@ExeFile"
    type "ExeFile"
    nlp "/script"
  ]
  node [
    id 12
    label "0);window.close();</script@ExeFile"
    type "ExeFile"
    nlp "0);window.close();</script"
  ]
  node [
    id 13
    label "address@ExeFile"
    type "ExeFile"
    nlp "address"
  ]
  node [
    id 14
    label "C2@ExeFile"
    type "ExeFile"
    nlp "C2"
  ]
  node [
    id 15
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 16
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 17
    label "tools@ExeFile"
    type "ExeFile"
    nlp "tools"
  ]
  node [
    id 18
    label "VMware@ExeFile"
    type "ExeFile"
    nlp "VMware"
  ]
  node [
    id 19
    label "\xe2\x80\x98MSASCuiLTasks\xe2\x80\x99@Service"
    type "Service"
    nlp "\xe2\x80\x98MSASCuiLTasks\xe2\x80\x99"
  ]
  node [
    id 20
    label "array@ExeFile"
    type "ExeFile"
    nlp "array"
  ]
  node [
    id 21
    label "Shellcode@ExeFile"
    type "ExeFile"
    nlp "Shellcode"
  ]
  node [
    id 22
    label "DLL@ExeFile"
    type "ExeFile"
    nlp "DLL"
  ]
  node [
    id 23
    label "information@ExeFile"
    type "ExeFile"
    nlp "information"
  ]
  node [
    id 24
    label "function@ExeFile"
    type "ExeFile"
    nlp "function"
  ]
  node [
    id 25
    label "DllMain@ExeFile"
    type "ExeFile"
    nlp "DllMain"
  ]
  node [
    id 26
    label "value@ExeFile"
    type "ExeFile"
    nlp "value"
  ]
  node [
    id 27
    label "XOR@ExeFile"
    type "ExeFile"
    nlp "XOR"
  ]
  node [
    id 28
    label "post@ExeFile"
    type "ExeFile"
    nlp "post"
  ]
  node [
    id 29
    label "Airbus@ExeFile"
    type "ExeFile"
    nlp "Airbus"
  ]
  node [
    id 30
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 31
    label "RAR@ExeFile"
    type "ExeFile"
    nlp "RAR"
  ]
  node [
    id 32
    label "teams@APTFamily"
    type "APTFamily"
    nlp "teams"
  ]
  node [
    id 33
    label "GIST@ExeFile"
    type "ExeFile"
    nlp "GIST"
  ]
  node [
    id 34
    label "factors@APTFamily"
    type "APTFamily"
    nlp "factors"
  ]
  node [
    id 35
    label "buf.find(\'DZJS\@ExeFile"
    type "ExeFile"
    nlp "buf.find(\'DZJS\"
  ]
  node [
    id 36
    label "decoded[4@ExeFile"
    type "ExeFile"
    nlp "decoded[4"
  ]
  node [
    id 37
    label "cscript@ExeFile"
    type "ExeFile"
    nlp "cscript"
  ]
  node [
    id 38
    label "explorer.execscript@ExeFile"
    type "ExeFile"
    nlp "explorer.execscript"
  ]
  node [
    id 39
    label "Document@DocumentFile"
    type "DocumentFile"
    nlp "Document"
  ]
  node [
    id 40
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 41
    label "Subscriptions@ExeFile"
    type "ExeFile"
    nlp "Subscriptions"
  ]
  node [
    id 42
    label "Documents@DocumentFile"
    type "DocumentFile"
    nlp "Documents"
  ]
  edge [
    source 0
    target 0
    action "prevent"
  ]
  edge [
    source 0
    target 13
    action "was"
  ]
  edge [
    source 0
    target 17
    action "creating"
  ]
  edge [
    source 0
    target 23
    action "are"
  ]
  edge [
    source 0
    target 32
    action "identify"
  ]
  edge [
    source 0
    target 9
    action "execute"
  ]
  edge [
    source 1
    target 3
    action "begins"
  ]
  edge [
    source 1
    target 8
    action "is"
  ]
  edge [
    source 1
    target 2
    action "dissect"
  ]
  edge [
    source 5
    target 6
    action "download"
  ]
  edge [
    source 7
    target 8
    action "is"
  ]
  edge [
    source 8
    target 9
    action "execute"
  ]
  edge [
    source 8
    target 15
    action "is"
  ]
  edge [
    source 8
    target 16
    action "be"
  ]
  edge [
    source 8
    target 8
    action "executes"
  ]
  edge [
    source 8
    target 0
    action "required"
  ]
  edge [
    source 13
    target 14
    action "returned"
  ]
  edge [
    source 13
    target 30
    action "shown"
  ]
  edge [
    source 14
    target 24
    action "are"
  ]
  edge [
    source 15
    target 8
    action "be"
  ]
  edge [
    source 17
    target 18
    action "is"
  ]
  edge [
    source 18
    target 19
    action "running"
  ]
  edge [
    source 20
    target 21
    action "executed"
  ]
  edge [
    source 23
    target 14
    action "are"
  ]
  edge [
    source 24
    target 25
    action "are"
  ]
  edge [
    source 26
    target 27
    action "described"
  ]
  edge [
    source 28
    target 29
    action "discussed"
  ]
  edge [
    source 31
    target 6
    action "sideloaded"
  ]
  edge [
    source 32
    target 0
    action "meaning"
  ]
  edge [
    source 34
    target 0
    action "is"
  ]
  edge [
    source 41
    target 42
    action "Report"
  ]
]
