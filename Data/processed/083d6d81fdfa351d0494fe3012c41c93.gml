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
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 2
    label "Leadership@ExeFile"
    type "ExeFile"
    nlp "Leadership"
  ]
  node [
    id 3
    label "Solutions\r@ExeFile"
    type "ExeFile"
    nlp "Solutions\r"
  ]
  node [
    id 4
    label "Cybersecurity@ExeFile"
    type "ExeFile"
    nlp "Cybersecurity"
  ]
  node [
    id 5
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 6
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 7
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 8
    label "service@ExeFile"
    type "ExeFile"
    nlp "service"
  ]
  node [
    id 9
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 10
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 11
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 12
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 13
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 14
    label "C:\\Windows\\Prefetch\\AT.EXE@ExeFile"
    type "ExeFile"
    nlp "C:\\Windows\\Prefetch\\AT.EXE"
  ]
  node [
    id 15
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 16
    label "TaskScheduler@Service"
    type "Service"
    nlp "TaskScheduler"
  ]
  node [
    id 17
    label "C:\\Windows\\System32\\Tasks\\At1@Service"
    type "Service"
    nlp "C:\\Windows\\System32\\Tasks\\At1"
  ]
  node [
    id 18
    label "C:\\Windows\\Tasks\\At1.job@Service"
    type "Service"
    nlp "C:\\Windows\\Tasks\\At1.job"
  ]
  node [
    id 19
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 20
    label "NT\\CurrentVersion\\Schedule\\TaskCache\\Tree\\At1@Service"
    type "Service"
    nlp "NT\\CurrentVersion\\Schedule\\TaskCache\\Tree\\At1"
  ]
  node [
    id 21
    label "Task@Service"
    type "Service"
    nlp "Task"
  ]
  node [
    id 22
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 23
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  edge [
    source 0
    target 0
    action "\r"
  ]
  edge [
    source 0
    target 2
    action "\r"
  ]
  edge [
    source 0
    target 3
    action "Based"
  ]
  edge [
    source 0
    target 5
    action "Based"
  ]
  edge [
    source 3
    target 4
    action "Based"
  ]
  edge [
    source 6
    target 7
    action "phishing"
  ]
  edge [
    source 6
    target 8
    action "provides"
  ]
  edge [
    source 6
    target 12
    action "deleted"
  ]
  edge [
    source 8
    target 9
    action "provides"
  ]
  edge [
    source 9
    target 10
    action "provides"
  ]
  edge [
    source 11
    target 16
    action "scheduled"
  ]
  edge [
    source 11
    target 15
    action "contain"
  ]
  edge [
    source 11
    target 18
    action "are"
  ]
  edge [
    source 12
    target 13
    action "compromised"
  ]
  edge [
    source 12
    target 10
    action "create"
  ]
  edge [
    source 12
    target 12
    action "are"
  ]
  edge [
    source 12
    target 21
    action "are"
  ]
  edge [
    source 15
    target 10
    action "originated"
  ]
  edge [
    source 15
    target 11
    action "submit"
  ]
  edge [
    source 17
    target 11
    action "are"
  ]
  edge [
    source 20
    target 11
    action "is"
  ]
  edge [
    source 23
    target 0
    action "compiles"
  ]
]
