graph [
  directed 1
  node [
    id 0
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 1
    label "information@ExeFile"
    type "ExeFile"
    nlp "information"
  ]
  node [
    id 2
    label "Mimikatz@ExeFile"
    type "ExeFile"
    nlp "Mimikatz"
  ]
  node [
    id 3
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 4
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 5
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 6
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 7
    label "x32@ExeFile"
    type "ExeFile"
    nlp "x32"
  ]
  node [
    id 8
    label "bypass@ExeFile"
    type "ExeFile"
    nlp "bypass"
  ]
  node [
    id 9
    label "kernal@ExeFile"
    type "ExeFile"
    nlp "kernal"
  ]
  node [
    id 10
    label "AppLocker@ExeFile"
    type "ExeFile"
    nlp "AppLocker"
  ]
  node [
    id 11
    label "WDigest@ExeFile"
    type "ExeFile"
    nlp "WDigest"
  ]
  node [
    id 12
    label "computer@ExeFile"
    type "ExeFile"
    nlp "computer"
  ]
  node [
    id 13
    label "database@ExeFile"
    type "ExeFile"
    nlp "database"
  ]
  node [
    id 14
    label "AD@ExeFile"
    type "ExeFile"
    nlp "AD"
  ]
  node [
    id 15
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 16
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 17
    label "OneDrive@ExeFile"
    type "ExeFile"
    nlp "OneDrive"
  ]
  node [
    id 18
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 19
    label "TGS@ExeFile"
    type "ExeFile"
    nlp "TGS"
  ]
  node [
    id 20
    label "password@ExeFile"
    type "ExeFile"
    nlp "password"
  ]
  node [
    id 21
    label "NTLM@ExeFile"
    type "ExeFile"
    nlp "NTLM"
  ]
  node [
    id 22
    label "vault@ExeFile"
    type "ExeFile"
    nlp "vault"
  ]
  node [
    id 23
    label "hash@ExeFile"
    type "ExeFile"
    nlp "hash"
  ]
  node [
    id 24
    label "service@ExeFile"
    type "ExeFile"
    nlp "service"
  ]
  node [
    id 25
    label "KDC@ExeFile"
    type "ExeFile"
    nlp "KDC"
  ]
  node [
    id 26
    label "KRBTGT@ExeFile"
    type "ExeFile"
    nlp "KRBTGT"
  ]
  node [
    id 27
    label "requests@ExeFile"
    type "ExeFile"
    nlp "requests"
  ]
  node [
    id 28
    label "TGT@ExeFile"
    type "ExeFile"
    nlp "TGT"
  ]
  node [
    id 29
    label "credential@DocumentFile"
    type "DocumentFile"
    nlp "credential"
  ]
  node [
    id 30
    label "checksum@ExeFile"
    type "ExeFile"
    nlp "checksum"
  ]
  node [
    id 31
    label "PAC@ExeFile"
    type "ExeFile"
    nlp "PAC"
  ]
  node [
    id 32
    label "keys@ExeFile"
    type "ExeFile"
    nlp "keys"
  ]
  node [
    id 33
    label "AES@ExeFile"
    type "ExeFile"
    nlp "AES"
  ]
  node [
    id 34
    label "key@ExeFile"
    type "ExeFile"
    nlp "key"
  ]
  node [
    id 35
    label "PSEXEC@ExeFile"
    type "ExeFile"
    nlp "PSEXEC"
  ]
  node [
    id 36
    label "Kerberos@ExeFile"
    type "ExeFile"
    nlp "Kerberos"
  ]
  node [
    id 37
    label "session@ExeFile"
    type "ExeFile"
    nlp "session"
  ]
  node [
    id 38
    label "request@ExeFile"
    type "ExeFile"
    nlp "request"
  ]
  node [
    id 39
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 40
    label "code@ExeFile"
    type "ExeFile"
    nlp "code"
  ]
  node [
    id 41
    label "IdentityModel@ExeFile"
    type "ExeFile"
    nlp "IdentityModel"
  ]
  node [
    id 42
    label "Commands@ExeFile"
    type "ExeFile"
    nlp "Commands"
  ]
  node [
    id 43
    label "kerberos::ptt@ExeFile"
    type "ExeFile"
    nlp "kerberos::ptt"
  ]
  node [
    id 44
    label "ekeys@ExeFile"
    type "ExeFile"
    nlp "ekeys"
  ]
  node [
    id 45
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 46
    label "SilverTicket@ExeFile"
    type "ExeFile"
    nlp "SilverTicket"
  ]
  node [
    id 47
    label "Exploiting@Vulnerability"
    type "Vulnerability"
    nlp "Exploiting"
  ]
  node [
    id 48
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 49
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 16
    action "load"
  ]
  edge [
    source 0
    target 40
    action "provided"
  ]
  edge [
    source 1
    target 2
    action "updated"
  ]
  edge [
    source 2
    target 3
    action "updated"
  ]
  edge [
    source 6
    target 7
    action "coded"
  ]
  edge [
    source 6
    target 14
    action "creating"
  ]
  edge [
    source 7
    target 4
    action "learn"
  ]
  edge [
    source 8
    target 9
    action "interact"
  ]
  edge [
    source 9
    target 10
    action "interact"
  ]
  edge [
    source 10
    target 6
    action "interact"
  ]
  edge [
    source 12
    target 13
    action "prevent"
  ]
  edge [
    source 13
    target 6
    action "prevent"
  ]
  edge [
    source 13
    target 14
    action "access"
  ]
  edge [
    source 15
    target 0
    action "is"
  ]
  edge [
    source 16
    target 47
    action "Building"
  ]
  edge [
    source 17
    target 4
    action "kept"
  ]
  edge [
    source 18
    target 5
    action "using"
  ]
  edge [
    source 19
    target 30
    action "claiming"
  ]
  edge [
    source 19
    target 19
    action "getting"
  ]
  edge [
    source 20
    target 21
    action "require"
  ]
  edge [
    source 20
    target 26
    action "is"
  ]
  edge [
    source 22
    target 6
    action "dumping"
  ]
  edge [
    source 23
    target 21
    action "is"
  ]
  edge [
    source 24
    target 25
    action "is"
  ]
  edge [
    source 27
    target 19
    action "does"
  ]
  edge [
    source 29
    target 29
    action "extracted"
  ]
  edge [
    source 30
    target 31
    action "is"
  ]
  edge [
    source 32
    target 33
    action "happen"
  ]
  edge [
    source 33
    target 34
    action "have"
  ]
  edge [
    source 34
    target 21
    action "have"
  ]
  edge [
    source 36
    target 37
    action "has"
  ]
  edge [
    source 36
    target 39
    action "Attacking"
  ]
  edge [
    source 37
    target 19
    action "has"
  ]
  edge [
    source 38
    target 19
    action "is"
  ]
]
