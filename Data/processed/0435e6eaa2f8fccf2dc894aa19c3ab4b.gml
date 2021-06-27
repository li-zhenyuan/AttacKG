graph [
  directed 1
  node [
    id 0
    label "AppLocker@ExeFile"
    type "ExeFile"
    nlp "AppLocker"
  ]
  node [
    id 1
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 2
    label "rules@ExeFile"
    type "ExeFile"
    nlp "rules"
  ]
  node [
    id 3
    label "blueteam@APTFamily"
    type "APTFamily"
    nlp "blueteam"
  ]
  node [
    id 4
    label "purpleteam@APTFamily"
    type "APTFamily"
    nlp "purpleteam"
  ]
  node [
    id 5
    label "PowerShell@ExeFile"
    type "ExeFile"
    nlp "PowerShell"
  ]
  edge [
    source 2
    target 0
    action "be"
  ]
]
