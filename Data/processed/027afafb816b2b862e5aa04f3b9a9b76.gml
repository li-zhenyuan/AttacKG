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
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 7
    label "factor@APTFamily"
    type "APTFamily"
    nlp "factor"
  ]
  node [
    id 8
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 9
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 10
    label "victim\@ExeFile"
    type "ExeFile"
    nlp "victim\"
  ]
  node [
    id 11
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 12
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 13
    label "actors\@APTFamily"
    type "APTFamily"
    nlp "actors\"
  ]
  node [
    id 14
    label "utility@ExeFile"
    type "ExeFile"
    nlp "utility"
  ]
  node [
    id 15
    label "PsExec@ExeFile"
    type "ExeFile"
    nlp "PsExec"
  ]
  node [
    id 16
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 17
    label "password@ExeFile"
    type "ExeFile"
    nlp "password"
  ]
  node [
    id 18
    label "NTLM@ExeFile"
    type "ExeFile"
    nlp "NTLM"
  ]
  node [
    id 19
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 20
    label "hash@ExeFile"
    type "ExeFile"
    nlp "hash"
  ]
  node [
    id 21
    label "events@ExeFile"
    type "ExeFile"
    nlp "events"
  ]
  node [
    id 22
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 23
    label "tool@ExeFile"
    type "ExeFile"
    nlp "tool"
  ]
  node [
    id 24
    label "service@ExeFile"
    type "ExeFile"
    nlp "service"
  ]
  node [
    id 25
    label "PSEXESVC@ExeFile"
    type "ExeFile"
    nlp "PSEXESVC"
  ]
  node [
    id 26
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  node [
    id 27
    label "SamIRetrieveMultiplePrimaryCredentials@DocumentFile"
    type "DocumentFile"
    nlp "SamIRetrieveMultiplePrimaryCredentials"
  ]
  node [
    id 28
    label "SamIRetrievePrimaryCredentials@DocumentFile"
    type "DocumentFile"
    nlp "SamIRetrievePrimaryCredentials"
  ]
  node [
    id 29
    label "function@ExeFile"
    type "ExeFile"
    nlp "function"
  ]
  node [
    id 30
    label "OpenProcess@ExeFile"
    type "ExeFile"
    nlp "OpenProcess"
  ]
  node [
    id 31
    label "signatures@ExeFile"
    type "ExeFile"
    nlp "signatures"
  ]
  node [
    id 32
    label "YARA@ExeFile"
    type "ExeFile"
    nlp "YARA"
  ]
  node [
    id 33
    label "team@APTFamily"
    type "APTFamily"
    nlp "team"
  ]
  node [
    id 34
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 35
    label "patch_SamIRetrievePrimaryCredential@DocumentFile"
    type "DocumentFile"
    nlp "patch_SamIRetrievePrimaryCredential"
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
    action "using"
  ]
  edge [
    source 6
    target 10
    action "redeploy"
  ]
  edge [
    source 7
    target 11
    action "using"
  ]
  edge [
    source 7
    target 34
    action "including"
  ]
  edge [
    source 8
    target 6
    action "using"
  ]
  edge [
    source 8
    target 11
    action "deploying"
  ]
  edge [
    source 8
    target 10
    action "deploy"
  ]
  edge [
    source 9
    target 7
    action "use"
  ]
  edge [
    source 9
    target 10
    action "authenticate"
  ]
  edge [
    source 11
    target 11
    action "Use"
  ]
  edge [
    source 11
    target 10
    action "targeted"
  ]
  edge [
    source 11
    target 7
    action "stolen"
  ]
  edge [
    source 13
    target 6
    action "compromised"
  ]
  edge [
    source 14
    target 15
    action "run"
  ]
  edge [
    source 15
    target 16
    action "resemble"
  ]
  edge [
    source 17
    target 18
    action "chosen"
  ]
  edge [
    source 19
    target 20
    action "corresponds"
  ]
  edge [
    source 20
    target 18
    action "configured"
  ]
  edge [
    source 21
    target 22
    action "alerting"
  ]
  edge [
    source 23
    target 15
    action "starting"
  ]
  edge [
    source 24
    target 25
    action "start"
  ]
  edge [
    source 27
    target 28
    action "set"
  ]
  edge [
    source 28
    target 27
    action "injected"
  ]
  edge [
    source 29
    target 30
    action "acquire"
  ]
  edge [
    source 31
    target 32
    action "following"
  ]
  edge [
    source 33
    target 8
    action "prevents"
  ]
]
