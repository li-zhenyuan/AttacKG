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
    label "Factory\r@APTFamily"
    type "APTFamily"
    nlp "Factory\r"
  ]
  node [
    id 2
    label "Email\r@NetLoc"
    type "NetLoc"
    nlp "Email\r"
  ]
  node [
    id 3
    label "FYNLOS@ExeFile"
    type "ExeFile"
    nlp "FYNLOS"
  ]
  node [
    id 4
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 5
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 6
    label "Task@Service"
    type "Service"
    nlp "Task"
  ]
  node [
    id 7
    label "Data%\\HostProcess\\{malware@ExeFile"
    type "ExeFile"
    nlp "Data%\\HostProcess\\{malware"
  ]
  node [
    id 8
    label "C:\\Documents@DocumentFile"
    type "DocumentFile"
    nlp "C:\\Documents"
  ]
  node [
    id 9
    label "system@ExeFile"
    type "ExeFile"
    nlp "system"
  ]
  node [
    id 10
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 11
    label "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\SystemDisableTaskMgr@Service"
    type "Service"
    nlp "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\SystemDisableTaskMgr"
  ]
  node [
    id 12
    label "backdoor@ExeFile"
    type "ExeFile"
    nlp "backdoor"
  ]
  node [
    id 13
    label "DetailsThis@ExeFile"
    type "ExeFile"
    nlp "DetailsThis"
  ]
  edge [
    source 6
    target 11
    action "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfileEnableFirewall"
  ]
  edge [
    source 7
    target 8
    action "is"
  ]
  edge [
    source 8
    target 9
    action "name}\\AppData\\Roaming"
  ]
  edge [
    source 8
    target 8
    action "said"
  ]
  edge [
    source 8
    target 12
    action "following"
  ]
  edge [
    source 9
    target 10
    action "is"
  ]
  edge [
    source 10
    target 8
    action "is"
  ]
  edge [
    source 12
    target 13
    action "following"
  ]
]
