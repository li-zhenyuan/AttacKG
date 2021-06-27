graph [
  directed 1
  node [
    id 0
    label "Subscriptions@ExeFile"
    type "ExeFile"
    nlp "Subscriptions"
  ]
  node [
    id 1
    label "IoT@ExeFile"
    type "ExeFile"
    nlp "IoT"
  ]
  node [
    id 2
    label "exploits@Vulnerability"
    type "Vulnerability"
    nlp "exploits"
  ]
  node [
    id 3
    label "descriptions@ExeFile"
    type "ExeFile"
    nlp "descriptions"
  ]
  node [
    id 4
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 5
    label "reports@ExeFile"
    type "ExeFile"
    nlp "reports"
  ]
  node [
    id 6
    label "APT@ExeFile"
    type "ExeFile"
    nlp "APT"
  ]
  node [
    id 7
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 8
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 9
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 10
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 11
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 12
    label "request@ExeFile"
    type "ExeFile"
    nlp "request"
  ]
  node [
    id 13
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 14
    label "instructions@ExeFile"
    type "ExeFile"
    nlp "instructions"
  ]
  node [
    id 15
    label "response@ExeFile"
    type "ExeFile"
    nlp "response"
  ]
  node [
    id 16
    label "BounceTime@ExeFile"
    type "ExeFile"
    nlp "BounceTime"
  ]
  node [
    id 17
    label "tunneling@ExeFile"
    type "ExeFile"
    nlp "tunneling"
  ]
  node [
    id 18
    label "APTs@APTFamily"
    type "APTFamily"
    nlp "APTs"
  ]
  node [
    id 19
    label "protocol@ExeFile"
    type "ExeFile"
    nlp "protocol"
  ]
  node [
    id 20
    label "Descriptions@ExeFile"
    type "ExeFile"
    nlp "Descriptions"
  ]
  node [
    id 21
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 22
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 23
    label "communication@ExeFile"
    type "ExeFile"
    nlp "communication"
  ]
  node [
    id 24
    label "APT10@APTFamily"
    type "APTFamily"
    nlp "APT10"
  ]
  edge [
    source 5
    target 6
    action "discussed"
  ]
  edge [
    source 7
    target 9
    action "scare"
  ]
  edge [
    source 7
    target 23
    action "facing"
  ]
  edge [
    source 8
    target 8
    action "discovered"
  ]
  edge [
    source 8
    target 7
    action "scare"
  ]
  edge [
    source 10
    target 9
    action "establishes"
  ]
  edge [
    source 10
    target 12
    action "looking"
  ]
  edge [
    source 10
    target 13
    action "fails"
  ]
  edge [
    source 12
    target 13
    action "forwarded"
  ]
  edge [
    source 13
    target 13
    action "looking"
  ]
  edge [
    source 14
    target 9
    action "including"
  ]
  edge [
    source 15
    target 9
    action "equals"
  ]
  edge [
    source 17
    target 13
    action "used"
  ]
  edge [
    source 19
    target 13
    action "is"
  ]
  edge [
    source 22
    target 21
    action "Save"
  ]
  edge [
    source 23
    target 9
    action "controlled"
  ]
]
