graph [
  directed 1
  node [
    id 0
    label "CrowdStrike@ExeFile"
    type "ExeFile"
    nlp "CrowdStrike"
  ]
  node [
    id 1
    label "Teams@APTFamily"
    type "APTFamily"
    nlp "Teams"
  ]
  node [
    id 2
    label "program@ExeFile"
    type "ExeFile"
    nlp "program"
  ]
  node [
    id 3
    label "MSP@ExeFile"
    type "ExeFile"
    nlp "MSP"
  ]
  node [
    id 4
    label "campaign@ExeFile"
    type "ExeFile"
    nlp "campaign"
  ]
  node [
    id 5
    label "recent\xc2\xa0spam@ExeFile"
    type "ExeFile"
    nlp "recent\xc2\xa0spam"
  ]
  node [
    id 6
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 7
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 8
    label "report@ExeFile"
    type "ExeFile"
    nlp "report"
  ]
  node [
    id 9
    label "VirusTotal@ExeFile"
    type "ExeFile"
    nlp "VirusTotal"
  ]
  node [
    id 10
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 11
    label "PUSH@ExeFile"
    type "ExeFile"
    nlp "PUSH"
  ]
  node [
    id 12
    label "RET@ExeFile"
    type "ExeFile"
    nlp "RET"
  ]
  node [
    id 13
    label "malware\xc2\xa0executes@ExeFile"
    type "ExeFile"
    nlp "malware\xc2\xa0executes"
  ]
  node [
    id 14
    label "MalwareMustDie@ExeFile"
    type "ExeFile"
    nlp "MalwareMustDie"
  ]
  node [
    id 15
    label "request@ExeFile"
    type "ExeFile"
    nlp "request"
  ]
  node [
    id 16
    label "POST@ExeFile"
    type "ExeFile"
    nlp "POST"
  ]
  node [
    id 17
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 18
    label "C&#38;C@ExeFile"
    type "ExeFile"
    nlp "C&#38;C"
  ]
  node [
    id 19
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 20
    label "batch@ExeFile"
    type "ExeFile"
    nlp "batch"
  ]
  node [
    id 21
    label "script\xc2\xa0is@ExeFile"
    type "ExeFile"
    nlp "script\xc2\xa0is"
  ]
  node [
    id 22
    label "source@ExeFile"
    type "ExeFile"
    nlp "source"
  ]
  node [
    id 23
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 24
    label "http://blog.malwaremustdie.org/2013/06/case-of-pony-downloaded-zeus-via.html@ExeFile"
    type "ExeFile"
    nlp "http://blog.malwaremustdie.org/2013/06/case-of-pony-downloaded-zeus-via.html"
  ]
  node [
    id 25
    label "@malwaremustdie@ExeFile"
    type "ExeFile"
    nlp "@malwaremustdie"
  ]
  edge [
    source 0
    target 1
    action "Explore"
  ]
  edge [
    source 2
    target 3
    action "Pricing"
  ]
  edge [
    source 4
    target 5
    action "delivered"
  ]
  edge [
    source 6
    target 7
    action "be"
  ]
  edge [
    source 6
    target 15
    action "sends"
  ]
  edge [
    source 8
    target 9
    action "are"
  ]
  edge [
    source 11
    target 12
    action "added"
  ]
  edge [
    source 15
    target 16
    action "seen"
  ]
  edge [
    source 17
    target 6
    action "collecting"
  ]
  edge [
    source 17
    target 18
    action "stolen"
  ]
  edge [
    source 19
    target 20
    action "creates"
  ]
  edge [
    source 22
    target 17
    action "are"
  ]
]
