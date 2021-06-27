graph [
  directed 1
  node [
    id 0
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 1
    label "utilization@ExeFile"
    type "ExeFile"
    nlp "utilization"
  ]
  node [
    id 2
    label "CPU@ExeFile"
    type "ExeFile"
    nlp "CPU"
  ]
  node [
    id 3
    label "CloudSploit@ExeFile"
    type "ExeFile"
    nlp "CloudSploit"
  ]
  node [
    id 4
    label "ConfigService@ExeFile"
    type "ExeFile"
    nlp "ConfigService"
  ]
  node [
    id 5
    label "teams@APTFamily"
    type "APTFamily"
    nlp "teams"
  ]
  node [
    id 6
    label "CloudTrail@ExeFile"
    type "ExeFile"
    nlp "CloudTrail"
  ]
  node [
    id 7
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 8
    label "logs@ExeFile"
    type "ExeFile"
    nlp "logs"
  ]
  node [
    id 9
    label "Tasks@Service"
    type "Service"
    nlp "Tasks"
  ]
  node [
    id 10
    label "HookdeckHow@ExeFile"
    type "ExeFile"
    nlp "HookdeckHow"
  ]
  node [
    id 11
    label "moreMake@ExeFile"
    type "ExeFile"
    nlp "moreMake"
  ]
  edge [
    source 1
    target 2
    action "gained"
  ]
  edge [
    source 8
    target 6
    action "ingest"
  ]
  edge [
    source 9
    target 10
    action "set"
  ]
  edge [
    source 10
    target 9
    action "set"
  ]
]
