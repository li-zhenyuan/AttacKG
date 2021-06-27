graph [
  directed 1
  node [
    id 0
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 1
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 2
    label "hash@ExeFile"
    type "ExeFile"
    nlp "hash"
  ]
  node [
    id 3
    label "NTLM@ExeFile"
    type "ExeFile"
    nlp "NTLM"
  ]
  node [
    id 4
    label "KDC@ExeFile"
    type "ExeFile"
    nlp "KDC"
  ]
  node [
    id 5
    label "User@ExeFile"
    type "ExeFile"
    nlp "User"
  ]
  node [
    id 6
    label "checksum@ExeFile"
    type "ExeFile"
    nlp "checksum"
  ]
  node [
    id 7
    label "PAC@ExeFile"
    type "ExeFile"
    nlp "PAC"
  ]
  node [
    id 8
    label "ticket@ExeFile"
    type "ExeFile"
    nlp "ticket"
  ]
  node [
    id 9
    label "TGS@ExeFile"
    type "ExeFile"
    nlp "TGS"
  ]
  node [
    id 10
    label "password@ExeFile"
    type "ExeFile"
    nlp "password"
  ]
  node [
    id 11
    label "TGT@ExeFile"
    type "ExeFile"
    nlp "TGT"
  ]
  node [
    id 12
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 13
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 14
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 15
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 16
    label "AD@ExeFile"
    type "ExeFile"
    nlp "AD"
  ]
  node [
    id 17
    label "computer@ExeFile"
    type "ExeFile"
    nlp "computer"
  ]
  node [
    id 18
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 19
    label "RID@ExeFile"
    type "ExeFile"
    nlp "RID"
  ]
  node [
    id 20
    label "service@ExeFile"
    type "ExeFile"
    nlp "service"
  ]
  node [
    id 21
    label "CIFS@ExeFile"
    type "ExeFile"
    nlp "CIFS"
  ]
  node [
    id 22
    label "type@ExeFile"
    type "ExeFile"
    nlp "type"
  ]
  node [
    id 23
    label "SPN@ExeFile"
    type "ExeFile"
    nlp "SPN"
  ]
  node [
    id 24
    label "SID@ExeFile"
    type "ExeFile"
    nlp "SID"
  ]
  node [
    id 25
    label "GPO@ExeFile"
    type "ExeFile"
    nlp "GPO"
  ]
  node [
    id 26
    label "Kerberos@ExeFile"
    type "ExeFile"
    nlp "Kerberos"
  ]
  node [
    id 27
    label "Tasks@Service"
    type "Service"
    nlp "Tasks"
  ]
  node [
    id 28
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 29
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 30
    label "Remoting@ExeFile"
    type "ExeFile"
    nlp "Remoting"
  ]
  node [
    id 31
    label "cmdlet@ExeFile"
    type "ExeFile"
    nlp "cmdlet"
  ]
  node [
    id 32
    label "shell@ExeFile"
    type "ExeFile"
    nlp "shell"
  ]
  node [
    id 33
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 34
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 35
    label "Commands@ExeFile"
    type "ExeFile"
    nlp "Commands"
  ]
  node [
    id 36
    label "WMI@ExeFile"
    type "ExeFile"
    nlp "WMI"
  ]
  node [
    id 37
    label "RunCommand@ExeFile"
    type "ExeFile"
    nlp "RunCommand"
  ]
  node [
    id 38
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 39
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 40
    label "GoldenTicket@ExeFile"
    type "ExeFile"
    nlp "GoldenTicket"
  ]
  node [
    id 41
    label "ScheduledTask@Service"
    type "Service"
    nlp "ScheduledTask"
  ]
  node [
    id 42
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  node [
    id 43
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 44
    label "Exploiting@Vulnerability"
    type "Vulnerability"
    nlp "Exploiting"
  ]
  edge [
    source 1
    target 32
    action "opens"
  ]
  edge [
    source 2
    target 3
    action "sent"
  ]
  edge [
    source 3
    target 15
    action "gain"
  ]
  edge [
    source 6
    target 7
    action "is"
  ]
  edge [
    source 8
    target 9
    action "opens"
  ]
  edge [
    source 9
    target 10
    action "using"
  ]
  edge [
    source 9
    target 6
    action "is"
  ]
  edge [
    source 10
    target 3
    action "is"
  ]
  edge [
    source 12
    target 12
    action "extracted"
  ]
  edge [
    source 13
    target 14
    action "being"
  ]
  edge [
    source 15
    target 16
    action "using"
  ]
  edge [
    source 16
    target 17
    action "changing"
  ]
  edge [
    source 17
    target 13
    action "gain"
  ]
  edge [
    source 18
    target 20
    action "following"
  ]
  edge [
    source 20
    target 21
    action "following"
  ]
  edge [
    source 22
    target 23
    action "identified"
  ]
  edge [
    source 25
    target 16
    action "changing"
  ]
  edge [
    source 26
    target 9
    action "enabled"
  ]
  edge [
    source 30
    target 1
    action "&#8217;s"
  ]
  edge [
    source 31
    target 1
    action "opens"
  ]
  edge [
    source 32
    target 1
    action "using"
  ]
  edge [
    source 34
    target 35
    action "using"
  ]
  edge [
    source 35
    target 36
    action "using"
  ]
  edge [
    source 38
    target 39
    action "Attacking"
  ]
  edge [
    source 43
    target 44
    action "Building"
  ]
]
