graph [
  directed 1
  node [
    id 0
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  node [
    id 1
    label "Exploits@Vulnerability"
    type "Vulnerability"
    nlp "Exploits"
  ]
  node [
    id 2
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 3
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 4
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 5
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 6
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 7
    label "campaign@ExeFile"
    type "ExeFile"
    nlp "campaign"
  ]
  node [
    id 8
    label "GhostNet@ExeFile"
    type "ExeFile"
    nlp "GhostNet"
  ]
  node [
    id 9
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 10
    label "attachments@DocumentFile"
    type "DocumentFile"
    nlp "attachments"
  ]
  node [
    id 11
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 12
    label "SubscriptionSubscribe@ExeFile"
    type "ExeFile"
    nlp "SubscriptionSubscribe"
  ]
  node [
    id 13
    label "UpdatedEmail@NetLoc"
    type "NetLoc"
    nlp "UpdatedEmail"
  ]
  edge [
    source 4
    target 5
    action "communicates"
  ]
  edge [
    source 4
    target 7
    action "was"
  ]
  edge [
    source 5
    target 6
    action "communicates"
  ]
  edge [
    source 7
    target 8
    action "was"
  ]
  edge [
    source 9
    target 10
    action "click"
  ]
  edge [
    source 10
    target 11
    action "click"
  ]
  edge [
    source 12
    target 13
    action "\r"
  ]
]
