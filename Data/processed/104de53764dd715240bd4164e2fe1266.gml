graph [
  directed 1
  node [
    id 0
    label "CASB@ExeFile"
    type "ExeFile"
    nlp "CASB"
  ]
  node [
    id 1
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 2
    label "builder@ExeFile"
    type "ExeFile"
    nlp "builder"
  ]
  node [
    id 3
    label "RAT@ExeFile"
    type "ExeFile"
    nlp "RAT"
  ]
  node [
    id 4
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 5
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "payloads@ExeFile"
    type "ExeFile"
    nlp "payloads"
  ]
  node [
    id 8
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 9
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 10
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 11
    label "Cobian@ExeFile"
    type "ExeFile"
    nlp "Cobian"
  ]
  node [
    id 12
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 13
    label "domain@ExeFile"
    type "ExeFile"
    nlp "domain"
  ]
  node [
    id 14
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 15
    label "LOGIN|-|Hack_805016|-|[email@NetLoc"
    type "NetLoc"
    nlp "LOGIN|-|Hack_805016|-|[email"
  ]
  node [
    id 16
    label "FormatLOGIN|-|BotID|-|[email@NetLoc"
    type "NetLoc"
    nlp "FormatLOGIN|-|BotID|-|[email"
  ]
  node [
    id 17
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 18
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 19
    label "|-|command@ExeFile"
    type "ExeFile"
    nlp "|-|command"
  ]
  node [
    id 20
    label "Actors@APTFamily"
    type "APTFamily"
    nlp "Actors"
  ]
  edge [
    source 2
    target 3
    action "performed"
  ]
  edge [
    source 3
    target 4
    action "sell"
  ]
  edge [
    source 3
    target 2
    action "shown"
  ]
  edge [
    source 3
    target 9
    action "performed"
  ]
  edge [
    source 3
    target 8
    action "hit"
  ]
  edge [
    source 3
    target 11
    action "supported"
  ]
  edge [
    source 4
    target 5
    action "sell"
  ]
  edge [
    source 5
    target 9
    action "be"
  ]
  edge [
    source 7
    target 5
    action "infected"
  ]
  edge [
    source 8
    target 3
    action "shown"
  ]
  edge [
    source 8
    target 11
    action "hit"
  ]
  edge [
    source 8
    target 8
    action "signed"
  ]
  edge [
    source 8
    target 14
    action "analyzed"
  ]
  edge [
    source 9
    target 9
    action "be"
  ]
  edge [
    source 9
    target 10
    action "get"
  ]
  edge [
    source 9
    target 12
    action "parsing"
  ]
  edge [
    source 10
    target 10
    action "be"
  ]
  edge [
    source 10
    target 8
    action "running"
  ]
  edge [
    source 10
    target 13
    action "analyzed"
  ]
  edge [
    source 11
    target 3
    action "running"
  ]
  edge [
    source 11
    target 8
    action "supported"
  ]
  edge [
    source 12
    target 10
    action "parsing"
  ]
  edge [
    source 12
    target 3
    action "supported"
  ]
  edge [
    source 13
    target 8
    action "analyzed"
  ]
]
