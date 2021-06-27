graph [
  directed 1
  node [
    id 0
    label "servers@ExeFile"
    type "ExeFile"
    nlp "servers"
  ]
  node [
    id 1
    label "Minecraft@ExeFile"
    type "ExeFile"
    nlp "Minecraft"
  ]
  node [
    id 2
    label "lookups@ExeFile"
    type "ExeFile"
    nlp "lookups"
  ]
  node [
    id 3
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 4
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 5
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 6
    label "Subscriptions@ExeFile"
    type "ExeFile"
    nlp "Subscriptions"
  ]
  edge [
    source 0
    target 1
    action "discover"
  ]
  edge [
    source 2
    target 3
    action "crawling"
  ]
  edge [
    source 4
    target 5
    action "asked"
  ]
]
