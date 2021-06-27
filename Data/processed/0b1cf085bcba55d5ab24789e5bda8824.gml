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
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "Task@Service"
    type "Service"
    nlp "Task"
  ]
  node [
    id 5
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 6
    label "spyware@ExeFile"
    type "ExeFile"
    nlp "spyware"
  ]
  node [
    id 7
    label "DetailsThis@ExeFile"
    type "ExeFile"
    nlp "DetailsThis"
  ]
  node [
    id 8
    label "Data%\\{malware@ExeFile"
    type "ExeFile"
    nlp "Data%\\{malware"
  ]
  node [
    id 9
    label "C:\\Documents@DocumentFile"
    type "DocumentFile"
    nlp "C:\\Documents"
  ]
  node [
    id 10
    label "malware\'s@ExeFile"
    type "ExeFile"
    nlp "malware\'s"
  ]
  node [
    id 11
    label "screen@ExeFile"
    type "ExeFile"
    nlp "screen"
  ]
  node [
    id 12
    label "POST@ExeFile"
    type "ExeFile"
    nlp "POST"
  ]
  node [
    id 13
    label "Tasks@Service"
    type "Service"
    nlp "Tasks"
  ]
  node [
    id 14
    label "taskschd.msc@Service"
    type "Service"
    nlp "taskschd.msc"
  ]
  node [
    id 15
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 16
    label "version@ExeFile"
    type "ExeFile"
    nlp "version"
  ]
  node [
    id 17
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 18
    label "page@ExeFile"
    type "ExeFile"
    nlp "page"
  ]
  node [
    id 19
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 20
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  edge [
    source 3
    target 8
    action "following"
  ]
  edge [
    source 3
    target 9
    action "following"
  ]
  edge [
    source 3
    target 5
    action "exists"
  ]
  edge [
    source 4
    target 5
    action "name}\\AppData\\Roaming"
  ]
  edge [
    source 4
    target 4
    action "click"
  ]
  edge [
    source 5
    target 3
    action "is"
  ]
  edge [
    source 5
    target 5
    action "delete"
  ]
  edge [
    source 6
    target 7
    action "name}\\AppData\\Roaming"
  ]
  edge [
    source 7
    target 3
    action "dropped"
  ]
  edge [
    source 9
    target 9
    action "scheduled"
  ]
  edge [
    source 11
    target 12
    action "is"
  ]
  edge [
    source 13
    target 3
    action "added"
  ]
  edge [
    source 13
    target 4
    action "delete"
  ]
  edge [
    source 14
    target 14
    action "type"
  ]
  edge [
    source 16
    target 17
    action "Search"
  ]
  edge [
    source 18
    target 19
    action "following"
  ]
]
