graph [
  directed 1
  node [
    id 0
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 1
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "actors\@APTFamily"
    type "APTFamily"
    nlp "actors\"
  ]
  node [
    id 4
    label "project@ExeFile"
    type "ExeFile"
    nlp "project"
  ]
  node [
    id 5
    label "GitHub@ExeFile"
    type "ExeFile"
    nlp "GitHub"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  node [
    id 8
    label "stager@ExeFile"
    type "ExeFile"
    nlp "stager"
  ]
  node [
    id 9
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 10
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 11
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 12
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 13
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 14
    label "victim\@ExeFile"
    type "ExeFile"
    nlp "victim\"
  ]
  node [
    id 15
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 16
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 17
    label "VBA@ExeFile"
    type "ExeFile"
    nlp "VBA"
  ]
  node [
    id 18
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 19
    label "WMI@ExeFile"
    type "ExeFile"
    nlp "WMI"
  ]
  node [
    id 20
    label "report@ExeFile"
    type "ExeFile"
    nlp "report"
  ]
  node [
    id 21
    label "TrustedSec@ExeFile"
    type "ExeFile"
    nlp "TrustedSec"
  ]
  node [
    id 22
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 23
    label "agent@ExeFile"
    type "ExeFile"
    nlp "agent"
  ]
  node [
    id 24
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 25
    label "Empire@ExeFile"
    type "ExeFile"
    nlp "Empire"
  ]
  node [
    id 26
    label "MuddyWater@ExeFile"
    type "ExeFile"
    nlp "MuddyWater"
  ]
  node [
    id 27
    label "AMP@ExeFile"
    type "ExeFile"
    nlp "AMP"
  ]
  node [
    id 28
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 29
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 30
    label "SIG@ExeFile"
    type "ExeFile"
    nlp "SIG"
  ]
  node [
    id 31
    label "APTs@APTFamily"
    type "APTFamily"
    nlp "APTs"
  ]
  edge [
    source 0
    target 1
    action "sent"
  ]
  edge [
    source 0
    target 13
    action "named"
  ]
  edge [
    source 0
    target 24
    action "harvest"
  ]
  edge [
    source 0
    target 26
    action "using"
  ]
  edge [
    source 1
    target 2
    action "was"
  ]
  edge [
    source 1
    target 9
    action "sent"
  ]
  edge [
    source 1
    target 1
    action "intended"
  ]
  edge [
    source 2
    target 1
    action "install"
  ]
  edge [
    source 2
    target 2
    action "associate"
  ]
  edge [
    source 5
    target 6
    action "execute"
  ]
  edge [
    source 6
    target 7
    action "execute"
  ]
  edge [
    source 6
    target 15
    action "set"
  ]
  edge [
    source 7
    target 8
    action "acted"
  ]
  edge [
    source 8
    target 12
    action "revealed"
  ]
  edge [
    source 8
    target 23
    action "analyzing"
  ]
  edge [
    source 8
    target 8
    action "communicate"
  ]
  edge [
    source 8
    target 6
    action "communicate"
  ]
  edge [
    source 10
    target 11
    action "uses"
  ]
  edge [
    source 10
    target 12
    action "run"
  ]
  edge [
    source 10
    target 13
    action "controlled"
  ]
  edge [
    source 10
    target 10
    action "appear"
  ]
  edge [
    source 11
    target 6
    action "run"
  ]
  edge [
    source 12
    target 11
    action "run"
  ]
  edge [
    source 12
    target 17
    action "contained"
  ]
  edge [
    source 12
    target 18
    action "were"
  ]
  edge [
    source 12
    target 15
    action "called"
  ]
  edge [
    source 12
    target 22
    action "obtain"
  ]
  edge [
    source 12
    target 7
    action "enumerate"
  ]
  edge [
    source 13
    target 1
    action "engineered"
  ]
  edge [
    source 13
    target 23
    action "leaving"
  ]
  edge [
    source 15
    target 16
    action "scheduled"
  ]
  edge [
    source 16
    target 7
    action "encoded"
  ]
  edge [
    source 16
    target 6
    action "encoded"
  ]
  edge [
    source 20
    target 21
    action "was"
  ]
  edge [
    source 23
    target 7
    action "analyzing"
  ]
  edge [
    source 23
    target 25
    action "leaving"
  ]
  edge [
    source 24
    target 14
    action "harvest"
  ]
  edge [
    source 27
    target 2
    action "prevent"
  ]
  edge [
    source 28
    target 29
    action "block"
  ]
  edge [
    source 29
    target 0
    action "sent"
  ]
]
