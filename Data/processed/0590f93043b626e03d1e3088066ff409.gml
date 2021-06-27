graph [
  directed 1
  node [
    id 0
    label "Email\r@NetLoc"
    type "NetLoc"
    nlp "Email\r"
  ]
  node [
    id 1
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 2
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "TSCookie@ExeFile"
    type "ExeFile"
    nlp "TSCookie"
  ]
  node [
    id 5
    label "PLEAD@ExeFile"
    type "ExeFile"
    nlp "PLEAD"
  ]
  node [
    id 6
    label "servers@ExeFile"
    type "ExeFile"
    nlp "servers"
  ]
  node [
    id 7
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 8
    label "format@ExeFile"
    type "ExeFile"
    nlp "format"
  ]
  node [
    id 9
    label "data@ExeFile"
    type "ExeFile"
    nlp "data"
  ]
  node [
    id 10
    label "HTTP@ExeFile"
    type "ExeFile"
    nlp "HTTP"
  ]
  node [
    id 11
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 12
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 13
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 14
    label "commands.)\r@ExeFile"
    type "ExeFile"
    nlp "commands.)\r"
  ]
  node [
    id 15
    label "command\r@ExeFile"
    type "ExeFile"
    nlp "command\r"
  ]
  node [
    id 16
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 17
    label "https://documents.trendmicro.com/assets/appendix-following-the-trail-of-blacktechs-cyber-espionage-campaigns.pdf\r@DocumentFile"
    type "DocumentFile"
    nlp "https://documents.trendmicro.com/assets/appendix-following-the-trail-of-blacktechs-cyber-espionage-campaigns.pdf\r"
  ]
  node [
    id 18
    label "configuration@ExeFile"
    type "ExeFile"
    nlp "configuration"
  ]
  node [
    id 19
    label "Description\r@ExeFile"
    type "ExeFile"
    nlp "Description\r"
  ]
  node [
    id 20
    label "Commands@ExeFile"
    type "ExeFile"
    nlp "Commands"
  ]
  node [
    id 21
    label "commands\r@ExeFile"
    type "ExeFile"
    nlp "commands\r"
  ]
  node [
    id 22
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  node [
    id 23
    label "malware\r@ExeFile"
    type "ExeFile"
    nlp "malware\r"
  ]
  edge [
    source 2
    target 3
    action "leading"
  ]
  edge [
    source 4
    target 5
    action "referred"
  ]
  edge [
    source 5
    target 3
    action "is"
  ]
  edge [
    source 6
    target 7
    action "communicating"
  ]
  edge [
    source 8
    target 9
    action "refer"
  ]
  edge [
    source 12
    target 13
    action "sent"
  ]
  edge [
    source 13
    target 7
    action "sent"
  ]
  edge [
    source 20
    target 21
    action "used"
  ]
]
