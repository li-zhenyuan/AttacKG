graph [
  directed 1
  node [
    id 0
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 1
    label "VirusTotal@ExeFile"
    type "ExeFile"
    nlp "VirusTotal"
  ]
  node [
    id 2
    label "JavaScript@ExeFile"
    type "ExeFile"
    nlp "JavaScript"
  ]
  node [
    id 3
    label "extension@ExeFile"
    type "ExeFile"
    nlp "extension"
  ]
  node [
    id 4
    label "Chrome@ExeFile"
    type "ExeFile"
    nlp "Chrome"
  ]
  node [
    id 5
    label "Dummy.document.forms[0].G4@DocumentFile"
    type "DocumentFile"
    nlp "Dummy.document.forms[0].G4"
  ]
  node [
    id 6
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 7
    label "malware\r@ExeFile"
    type "ExeFile"
    nlp "malware\r"
  ]
  node [
    id 8
    label "document.forms@DocumentFile"
    type "DocumentFile"
    nlp "document.forms"
  ]
  node [
    id 9
    label "name@ExeFile"
    type "ExeFile"
    nlp "name"
  ]
  node [
    id 10
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 11
    label "HTTPS@ExeFile"
    type "ExeFile"
    nlp "HTTPS"
  ]
  node [
    id 12
    label "encryption@ExeFile"
    type "ExeFile"
    nlp "encryption"
  ]
  node [
    id 13
    label "SSL@ExeFile"
    type "ExeFile"
    nlp "SSL"
  ]
  node [
    id 14
    label "connection@ExeFile"
    type "ExeFile"
    nlp "connection"
  ]
  node [
    id 15
    label "information@ExeFile"
    type "ExeFile"
    nlp "information"
  ]
  node [
    id 16
    label "login@ExeFile"
    type "ExeFile"
    nlp "login"
  ]
  node [
    id 17
    label "https://blog.malwarebytes.com/threat-analysis/2016/01/rogue-google-chrome-extension-spies-on-you/\r@ExeFile"
    type "ExeFile"
    nlp "https://blog.malwarebytes.com/threat-analysis/2016/01/rogue-google-chrome-extension-spies-on-you/\r"
  ]
  node [
    id 18
    label "https://www.welivesecurity.com/2013/03/13/how-theola-malware-uses-a-chrome-plugin-for-banking-fraud/\r@ExeFile"
    type "ExeFile"
    nlp "https://www.welivesecurity.com/2013/03/13/how-theola-malware-uses-a-chrome-plugin-for-banking-fraud/\r"
  ]
  edge [
    source 0
    target 1
    action "developed"
  ]
  edge [
    source 0
    target 2
    action "start"
  ]
  edge [
    source 0
    target 14
    action "posted"
  ]
  edge [
    source 0
    target 15
    action "collected"
  ]
  edge [
    source 1
    target 2
    action "developed"
  ]
  edge [
    source 3
    target 4
    action "clicking"
  ]
  edge [
    source 6
    target 0
    action "posted"
  ]
  edge [
    source 11
    target 0
    action "sending"
  ]
  edge [
    source 12
    target 13
    action "called"
  ]
  edge [
    source 14
    target 13
    action "posted"
  ]
  edge [
    source 14
    target 11
    action "were"
  ]
  edge [
    source 15
    target 16
    action "collected"
  ]
]
