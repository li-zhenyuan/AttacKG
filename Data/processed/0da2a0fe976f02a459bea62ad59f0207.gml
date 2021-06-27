graph [
  directed 1
  node [
    id 0
    label "Actors@APTFamily"
    type "APTFamily"
    nlp "Actors"
  ]
  node [
    id 1
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 2
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 3
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 4
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 5
    label "machines@ExeFile"
    type "ExeFile"
    nlp "machines"
  ]
  node [
    id 6
    label "victims\xe2\x80\x99@ExeFile"
    type "ExeFile"
    nlp "victims\xe2\x80\x99"
  ]
  node [
    id 7
    label "RAT@ExeFile"
    type "ExeFile"
    nlp "RAT"
  ]
  node [
    id 8
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 9
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 10
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 11
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 12
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 13
    label "payloadCommand@ExeFile"
    type "ExeFile"
    nlp "payloadCommand"
  ]
  node [
    id 14
    label "\xe2\x80\x9cCommand@ExeFile"
    type "ExeFile"
    nlp "\xe2\x80\x9cCommand"
  ]
  node [
    id 15
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 16
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 17
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 18
    label "appdata%\\NeutralApp\\NeutralApp.exeCommand@ExeFile"
    type "ExeFile"
    nlp "appdata%\\NeutralApp\\NeutralApp.exeCommand"
  ]
  node [
    id 19
    label "AnalysisThe@ExeFile"
    type "ExeFile"
    nlp "AnalysisThe"
  ]
  node [
    id 20
    label "auto@ExeFile"
    type "ExeFile"
    nlp "auto"
  ]
  node [
    id 21
    label "googlemail[.]commail@NetLoc"
    type "NetLoc"
    nlp "googlemail[.]commail"
  ]
  node [
    id 22
    label "tv[.]comdockooment[.]comdocsautentification[.]comg000glemail[.]comgoogldraive[.]comgoogledockumets[.]comgoogledraive[.]comgooglesuport[.]comgooglmaile[.]comgooglsupport[.]comgovreportst[.]comiceerd[.]comlogin@NetLoc"
    type "NetLoc"
    nlp "tv[.]comdockooment[.]comdocsautentification[.]comg000glemail[.]comgoogldraive[.]comgoogledockumets[.]comgoogledraive[.]comgooglesuport[.]comgooglmaile[.]comgooglsupport[.]comgovreportst[.]comiceerd[.]comlogin"
  ]
  edge [
    source 0
    target 1
    action "targeting"
  ]
  edge [
    source 2
    target 8
    action "accounts"
  ]
  edge [
    source 3
    target 4
    action "exfiltrate"
  ]
  edge [
    source 4
    target 5
    action "exfiltrate"
  ]
  edge [
    source 5
    target 6
    action "exfiltrate"
  ]
  edge [
    source 7
    target 2
    action "was"
  ]
  edge [
    source 9
    target 10
    action "distribute"
  ]
  edge [
    source 15
    target 16
    action "install"
  ]
  edge [
    source 16
    target 20
    action "added"
  ]
  edge [
    source 19
    target 9
    action "used"
  ]
]
