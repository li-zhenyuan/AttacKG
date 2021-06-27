graph [
  directed 1
  node [
    id 0
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 1
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 2
    label "attachments@DocumentFile"
    type "DocumentFile"
    nlp "attachments"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 5
    label "keys@ExeFile"
    type "ExeFile"
    nlp "keys"
  ]
  node [
    id 6
    label "links@ExeFile"
    type "ExeFile"
    nlp "links"
  ]
  node [
    id 7
    label "OLE@ExeFile"
    type "ExeFile"
    nlp "OLE"
  ]
  node [
    id 8
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 9
    label "Exploit@Vulnerability"
    type "Vulnerability"
    nlp "Exploit"
  ]
  node [
    id 10
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 11
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 12
    label "downloader@ExeFile"
    type "ExeFile"
    nlp "downloader"
  ]
  node [
    id 13
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 14
    label "https://blogs.technet.microsoft.com/mmpc/2017/10/23/windows-defender-exploit-guard-reduce-the-attack-surface-against-next-generation-malware/@Vulnerability"
    type "Vulnerability"
    nlp "https://blogs.technet.microsoft.com/mmpc/2017/10/23/windows-defender-exploit-guard-reduce-the-attack-surface-against-next-generation-malware/"
  ]
  node [
    id 15
    label "Attack@ExeFile"
    type "ExeFile"
    nlp "Attack"
  ]
  node [
    id 16
    label "surface@ExeFile"
    type "ExeFile"
    nlp "surface"
  ]
  node [
    id 17
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 13
    action "Emerging"
  ]
  edge [
    source 1
    target 1
    action "open"
  ]
  edge [
    source 1
    target 2
    action "use"
  ]
  edge [
    source 2
    target 1
    action "opening"
  ]
  edge [
    source 2
    target 3
    action "spread"
  ]
  edge [
    source 4
    target 5
    action "following"
  ]
  edge [
    source 6
    target 7
    action "Setting"
  ]
  edge [
    source 8
    target 8
    action "is"
  ]
  edge [
    source 9
    target 3
    action "block"
  ]
  edge [
    source 9
    target 0
    action "execute"
  ]
  edge [
    source 9
    target 9
    action "learn"
  ]
  edge [
    source 11
    target 12
    action "Emerging"
  ]
  edge [
    source 12
    target 0
    action "Emerging"
  ]
  edge [
    source 15
    target 16
    action "Updated"
  ]
]
