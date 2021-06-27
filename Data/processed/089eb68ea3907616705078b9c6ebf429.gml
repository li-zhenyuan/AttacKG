graph [
  directed 1
  node [
    id 0
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 1
    label "actor@APTFamily"
    type "APTFamily"
    nlp "actor"
  ]
  node [
    id 2
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "communication@ExeFile"
    type "ExeFile"
    nlp "communication"
  ]
  node [
    id 5
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 6
    label "compromise@ExeFile"
    type "ExeFile"
    nlp "compromise"
  ]
  node [
    id 7
    label "redirections@ExeFile"
    type "ExeFile"
    nlp "redirections"
  ]
  node [
    id 8
    label "redirection@ExeFile"
    type "ExeFile"
    nlp "redirection"
  ]
  node [
    id 9
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 10
    label "LinkedIn@ExeFile"
    type "ExeFile"
    nlp "LinkedIn"
  ]
  node [
    id 11
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 12
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 13
    label "DNSpionage@ExeFile"
    type "ExeFile"
    nlp "DNSpionage"
  ]
  node [
    id 14
    label "tunneling@ExeFile"
    type "ExeFile"
    nlp "tunneling"
  ]
  node [
    id 15
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 16
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 17
    label "C2@ExeFile"
    type "ExeFile"
    nlp "C2"
  ]
  node [
    id 18
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 19
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 20
    label "request@ExeFile"
    type "ExeFile"
    nlp "request"
  ]
  node [
    id 21
    label "HTTP@ExeFile"
    type "ExeFile"
    nlp "HTTP"
  ]
  node [
    id 22
    label "requests@ExeFile"
    type "ExeFile"
    nlp "requests"
  ]
  node [
    id 23
    label "CreateProcess@ExeFile"
    type "ExeFile"
    nlp "CreateProcess"
  ]
  node [
    id 24
    label "article@ExeFile"
    type "ExeFile"
    nlp "article"
  ]
  node [
    id 25
    label "GT@ExeFile"
    type "ExeFile"
    nlp "GT"
  ]
  node [
    id 26
    label "address@ExeFile"
    type "ExeFile"
    nlp "address"
  ]
  node [
    id 27
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 28
    label "protocol@ExeFile"
    type "ExeFile"
    nlp "protocol"
  ]
  node [
    id 29
    label "exfiltration@ExeFile"
    type "ExeFile"
    nlp "exfiltration"
  ]
  node [
    id 30
    label "domain@ExeFile"
    type "ExeFile"
    nlp "domain"
  ]
  node [
    id 31
    label "addresses@ExeFile"
    type "ExeFile"
    nlp "addresses"
  ]
  node [
    id 32
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 33
    label "GMT@ExeFile"
    type "ExeFile"
    nlp "GMT"
  ]
  node [
    id 34
    label "memail.mea.com.lb@NetLoc"
    type "NetLoc"
    nlp "memail.mea.com.lb"
  ]
  node [
    id 35
    label "memailfr.meacorp.com.lb@NetLoc"
    type "NetLoc"
    nlp "memailfr.meacorp.com.lb"
  ]
  node [
    id 36
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 37
    label "AMP@ExeFile"
    type "ExeFile"
    nlp "AMP"
  ]
  node [
    id 38
    label "emails@NetLoc"
    type "NetLoc"
    nlp "emails"
  ]
  node [
    id 39
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 40
    label "SIG@ExeFile"
    type "ExeFile"
    nlp "SIG"
  ]
  node [
    id 41
    label "LB@ExeFile"
    type "ExeFile"
    nlp "LB"
  ]
  node [
    id 42
    label "certificate@ExeFile"
    type "ExeFile"
    nlp "certificate"
  ]
  node [
    id 43
    label "MEA@ExeFile"
    type "ExeFile"
    nlp "MEA"
  ]
  edge [
    source 0
    target 9
    action "circulated"
  ]
  edge [
    source 1
    target 6
    action "generated"
  ]
  edge [
    source 3
    target 4
    action "supports"
  ]
  edge [
    source 3
    target 0
    action "is"
  ]
  edge [
    source 3
    target 5
    action "supports"
  ]
  edge [
    source 3
    target 22
    action "craft"
  ]
  edge [
    source 3
    target 18
    action "executing"
  ]
  edge [
    source 3
    target 19
    action "performs"
  ]
  edge [
    source 3
    target 8
    action "discovered"
  ]
  edge [
    source 3
    target 29
    action "using"
  ]
  edge [
    source 3
    target 36
    action "used"
  ]
  edge [
    source 4
    target 5
    action "calling"
  ]
  edge [
    source 5
    target 1
    action "are"
  ]
  edge [
    source 5
    target 16
    action "communicate"
  ]
  edge [
    source 5
    target 19
    action "is"
  ]
  edge [
    source 6
    target 5
    action "generated"
  ]
  edge [
    source 7
    target 5
    action "were"
  ]
  edge [
    source 8
    target 5
    action "including"
  ]
  edge [
    source 8
    target 9
    action "was"
  ]
  edge [
    source 9
    target 10
    action "phishing"
  ]
  edge [
    source 9
    target 32
    action "harvest"
  ]
  edge [
    source 9
    target 5
    action "was"
  ]
  edge [
    source 13
    target 14
    action "supports"
  ]
  edge [
    source 14
    target 5
    action "supports"
  ]
  edge [
    source 15
    target 16
    action "downloaded"
  ]
  edge [
    source 16
    target 17
    action "communicate"
  ]
  edge [
    source 16
    target 21
    action "received"
  ]
  edge [
    source 16
    target 27
    action "replies"
  ]
  edge [
    source 17
    target 20
    action "replies"
  ]
  edge [
    source 18
    target 18
    action "executed"
  ]
  edge [
    source 18
    target 3
    action "is"
  ]
  edge [
    source 19
    target 5
    action "serves"
  ]
  edge [
    source 19
    target 20
    action "is"
  ]
  edge [
    source 20
    target 5
    action "is"
  ]
  edge [
    source 22
    target 5
    action "craft"
  ]
  edge [
    source 23
    target 18
    action "executes"
  ]
  edge [
    source 26
    target 16
    action "replies"
  ]
  edge [
    source 27
    target 17
    action "replies"
  ]
  edge [
    source 28
    target 5
    action "is"
  ]
  edge [
    source 29
    target 5
    action "using"
  ]
  edge [
    source 30
    target 13
    action "linked"
  ]
  edge [
    source 31
    target 27
    action "controlled"
  ]
  edge [
    source 32
    target 9
    action "harvest"
  ]
  edge [
    source 34
    target 33
    action "was"
  ]
  edge [
    source 37
    target 3
    action "prevent"
  ]
  edge [
    source 38
    target 39
    action "block"
  ]
  edge [
    source 39
    target 36
    action "sent"
  ]
]
