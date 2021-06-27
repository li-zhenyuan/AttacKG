graph [
  directed 1
  node [
    id 0
    label "security@ExeFile"
    type "ExeFile"
    nlp "security"
  ]
  node [
    id 1
    label "TodayUnder@ExeFile"
    type "ExeFile"
    nlp "TodayUnder"
  ]
  node [
    id 2
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 3
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 4
    label "value@ExeFile"
    type "ExeFile"
    nlp "value"
  ]
  node [
    id 5
    label "Stamp@ExeFile"
    type "ExeFile"
    nlp "Stamp"
  ]
  node [
    id 6
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 7
    label "Outlook</title><script@ExeFile"
    type "ExeFile"
    nlp "Outlook</title><script"
  ]
  node [
    id 8
    label "CreateObject(&#34;Wscript@ExeFile"
    type "ExeFile"
    nlp "CreateObject(&#34;Wscript"
  ]
  node [
    id 9
    label "Sub--></script></head></htmlInvisibilityThis@ExeFile"
    type "ExeFile"
    nlp "Sub--></script></head></htmlInvisibilityThis"
  ]
  node [
    id 10
    label "sandbox@ExeFile"
    type "ExeFile"
    nlp "sandbox"
  ]
  node [
    id 11
    label "HTML@ExeFile"
    type "ExeFile"
    nlp "HTML"
  ]
  node [
    id 12
    label "keys@ExeFile"
    type "ExeFile"
    nlp "keys"
  ]
  node [
    id 13
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  edge [
    source 0
    target 1
    action "prevent"
  ]
  edge [
    source 4
    target 5
    action "is"
  ]
  edge [
    source 5
    target 4
    action "be"
  ]
  edge [
    source 6
    target 13
    action "are"
  ]
  edge [
    source 10
    target 11
    action "duplicate"
  ]
  edge [
    source 12
    target 6
    action "are"
  ]
]
