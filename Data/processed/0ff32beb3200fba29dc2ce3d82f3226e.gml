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
    label "profiles@ExeFile"
    type "ExeFile"
    nlp "profiles"
  ]
  node [
    id 7
    label "LinkedIn@ExeFile"
    type "ExeFile"
    nlp "LinkedIn"
  ]
  node [
    id 8
    label "users@ExeFile"
    type "ExeFile"
    nlp "users"
  ]
  node [
    id 9
    label "accounts@ExeFile"
    type "ExeFile"
    nlp "accounts"
  ]
  node [
    id 10
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 11
    label "descriptions@ExeFile"
    type "ExeFile"
    nlp "descriptions"
  ]
  node [
    id 12
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 13
    label "ExxonMobil@ExeFile"
    type "ExeFile"
    nlp "ExxonMobil"
  ]
  node [
    id 14
    label "job@ExeFile"
    type "ExeFile"
    nlp "job"
  ]
  node [
    id 15
    label "skills@ExeFile"
    type "ExeFile"
    nlp "skills"
  ]
  node [
    id 16
    label "connections@ExeFile"
    type "ExeFile"
    nlp "connections"
  ]
  node [
    id 17
    label "profile@ExeFile"
    type "ExeFile"
    nlp "profile"
  ]
  node [
    id 18
    label "ID@ExeFile"
    type "ExeFile"
    nlp "ID"
  ]
  node [
    id 19
    label "exploitation@Vulnerability"
    type "Vulnerability"
    nlp "exploitation"
  ]
  node [
    id 20
    label "functionality@ExeFile"
    type "ExeFile"
    nlp "functionality"
  ]
  node [
    id 21
    label "personas@ExeFile"
    type "ExeFile"
    nlp "personas"
  ]
  node [
    id 22
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 23
    label "persona@ExeFile"
    type "ExeFile"
    nlp "persona"
  ]
  node [
    id 24
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
    action "associated"
  ]
  edge [
    source 7
    target 15
    action "provide"
  ]
  edge [
    source 8
    target 7
    action "have"
  ]
  edge [
    source 9
    target 7
    action "supporting"
  ]
  edge [
    source 10
    target 16
    action "provide"
  ]
  edge [
    source 10
    target 22
    action "disguised"
  ]
  edge [
    source 12
    target 13
    action "was"
  ]
  edge [
    source 13
    target 14
    action "was"
  ]
  edge [
    source 16
    target 7
    action "provide"
  ]
  edge [
    source 18
    target 7
    action "remains"
  ]
  edge [
    source 19
    target 20
    action "associated"
  ]
  edge [
    source 20
    target 7
    action "associated"
  ]
  edge [
    source 21
    target 7
    action "research"
  ]
  edge [
    source 23
    target 7
    action "is"
  ]
  edge [
    source 24
    target 0
    action "compiles"
  ]
]
