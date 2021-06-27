graph [
  directed 1
  node [
    id 0
    label "ExploitsLearn@Vulnerability"
    type "Vulnerability"
    nlp "ExploitsLearn"
  ]
  node [
    id 1
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 2
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 3
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 4
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 5
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 6
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 7
    label "OSX@ExeFile"
    type "ExeFile"
    nlp "OSX"
  ]
  node [
    id 8
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 9
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 10
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 11
    label "PromptForCredential@DocumentFile"
    type "DocumentFile"
    nlp "PromptForCredential"
  ]
  node [
    id 12
    label "WMI@ExeFile"
    type "ExeFile"
    nlp "WMI"
  ]
  node [
    id 13
    label "WebClient).DownloadString(\xe2\x80\x98hxxp://evil.payload@ExeFile"
    type "ExeFile"
    nlp "WebClient).DownloadString(\xe2\x80\x98hxxp://evil.payload"
  ]
  node [
    id 14
    label "exec_powershell@ExeFile"
    type "ExeFile"
    nlp "exec_powershell"
  ]
  node [
    id 15
    label "post@ExeFile"
    type "ExeFile"
    nlp "post"
  ]
  node [
    id 16
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 17
    label "Remoting@ExeFile"
    type "ExeFile"
    nlp "Remoting"
  ]
  node [
    id 18
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 19
    label "Documentation\r@DocumentFile"
    type "DocumentFile"
    nlp "Documentation\r"
  ]
  node [
    id 20
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  edge [
    source 3
    target 9
    action "\xe2\x80\x98trusted"
  ]
  edge [
    source 9
    target 10
    action "coded"
  ]
  edge [
    source 10
    target 10
    action "execute"
  ]
  edge [
    source 11
    target 3
    action "convert"
  ]
  edge [
    source 14
    target 15
    action "launch"
  ]
  edge [
    source 15
    target 16
    action "launch"
  ]
  edge [
    source 16
    target 9
    action "launch"
  ]
  edge [
    source 17
    target 10
    action "enable"
  ]
]
