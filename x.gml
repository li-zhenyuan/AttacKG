graph [
  directed 1
  node [
    id 0
    label "microsoft#file#12"
    type "file"
    nlp "Microsoft,"
    regex ""
    contraction ""
  ]
  node [
    id 1
    label "vmware#file#29"
    type "file"
    nlp "VMware"
    regex ""
    contraction ""
  ]
  node [
    id 2
    label "horizon#file#38"
    type "file"
    nlp "Horizon"
    regex ""
    contraction ""
  ]
  node [
    id 3
    label "actor#actor#82"
    type "actor"
    nlp "actor"
    regex ""
    contraction ""
  ]
  node [
    id 4
    label "dns#network#88"
    type "network"
    nlp "DNS network"
    regex "dns[.]1433[.]eu[.]org"
    contraction ""
  ]
  node [
    id 5
    label "shell#network#137"
    type "network"
    nlp "interactive shell"
    regex ""
    contraction ""
  ]
  node [
    id 6
    label "order#file#151"
    type "file"
    nlp "order"
    regex ""
    contraction ""
  ]
  node [
    id 7
    label "details#network#204"
    type "network"
    nlp "details"
    regex ""
    contraction ""
  ]
  node [
    id 8
    label "team#executable#209"
    type "executable"
    nlp "team"
    regex ""
    contraction ""
  ]
  node [
    id 9
    label "exploit#vulnerability#226"
    type "vulnerability"
    nlp "exploit"
    regex ""
    contraction ""
  ]
  node [
    id 10
    label "panda#executable#252"
    type "executable"
    nlp "Aquatic Panda"
    regex ""
    contraction ""
  ]
  node [
    id 11
    label "system#system#312"
    type "system"
    nlp "system"
    regex ""
    contraction ""
  ]
  node [
    id 12
    label "party#network#329"
    type "network"
    nlp "third-party endpoint"
    regex ""
    contraction ""
  ]
  node [
    id 13
    label "overwatch#file#392"
    type "file"
    nlp "OverWatch"
    regex ""
    contraction ""
  ]
  node [
    id 14
    label "hijacking#file#412"
    type "file"
    nlp "hijacking"
    regex ""
    contraction ""
  ]
  node [
    id 15
    label "dll#executable#408"
    type "executable"
    nlp "DLL"
    regex ""
    contraction ""
  ]
  node [
    id 16
    label "attempts#file#424"
    type "file"
    nlp "attempts VBS"
    regex ""
    contraction ""
  ]
  node [
    id 17
    label "lsass#network#434"
    type "network"
    nlp "LSASS"
    regex ""
    contraction ""
  ]
  node [
    id 18
    label "winrar#executable#461"
    type "executable"
    nlp "winRAR"
    regex ""
    contraction ""
  ]
  node [
    id 19
    label "preparation#file#468"
    type "file"
    nlp "preparation"
    regex ""
    contraction ""
  ]
  node [
    id 20
    label "executables#executable#480"
    type "executable"
    nlp "executables"
    regex ""
    contraction ""
  ]
  edge [
    source 0
    target 3
    action ""
    sequence 0
    nlp "&#10;        Due to its ubiquitous use, many common infrastructure products from Microsoft, Apple, Twitter, CloudFlare and others are vulnerable to Log4Shell attacks."
  ]
  edge [
    source 1
    target 13
    action ""
    sequence 4
    nlp "Recently, VMware also issued guidance that some components of its Horizon service are vulnerable to Log4j exploits, leading OverWatch to add the VMware Horizon Tomcat web server service to their processes-to-watch list, researchers said."
  ]
  edge [
    source 2
    target 3
    action ""
    sequence 7
    nlp "Recently, VMware also issued guidance that some components of its Horizon service are vulnerable to Log4j exploits, leading OverWatch to add the VMware Horizon Tomcat web server service to their processes-to-watch list, researchers said."
  ]
  edge [
    source 3
    target 5
    action ""
    sequence 21
    nlp "&#10;        &#8220;The threat actor then executed a series of Linux commands, including attempting to execute a bash-based interactive shell with a hardcoded IP address as well as curl and wget commands in order to retrieve threat-actor tooling hosted on remote infrastructure,&#8221; researchers wrote."
  ]
  edge [
    source 3
    target 4
    action ""
    sequence 11
    nlp "&#10;        The Falcon OverWatch team noticed the Aquatic Panda intrusion when the threat actor performed multiple connectivity checks via DNS lookups for a subdomain under network, executed under the Apache Tomcat service running on the VMware Horizon instance, they wrote in the post."
  ]
  edge [
    source 3
    target 18
    action ""
    sequence 46
    nlp "&#10;        &#8220;The threat actor used winRAR to compress the memory dump in preparation for exfiltration before attempting to cover their tracks by deleting all executables from the ProgramData and Windows&#9;emp\ directories,&#8221; researchers wrote."
  ]
  edge [
    source 3
    target 20
    action ""
    sequence 49
    nlp "&#10;        &#8220;The threat actor used winRAR to compress the memory dump in preparation for exfiltration before attempting to cover their tracks by deleting all executables from the ProgramData and Windows&#9;emp\ directories,&#8221; researchers wrote."
  ]
  edge [
    source 3
    target 13
    action ""
    sequence 23
    nlp "&#10;        The commands were executed on a Windows host under the Apache Tomcat service, researchers said."
  ]
  edge [
    source 3
    target 8
    action ""
    sequence 8
    nlp "&#10;        The Falcon OverWatch team noticed the Aquatic Panda intrusion when the threat actor performed multiple connectivity checks via DNS lookups for a subdomain under network, executed under the Apache Tomcat service running on the VMware Horizon instance, they wrote in the post."
  ]
  edge [
    source 3
    target 16
    action ""
    sequence 28
    nlp "&#10;        OverWatch researchers tracked the threat actor&#8217;s activity closely during the intrusion to provide continuous updates to academic institution as its security administrators scrambled to mitigate the attack, they said."
  ]
  edge [
    source 4
    target 13
    action ""
    sequence 13
    nlp "&#10;        The Falcon OverWatch team noticed the Aquatic Panda intrusion when the threat actor performed multiple connectivity checks via DNS lookups for a subdomain under network, executed under the Apache Tomcat service running on the VMware Horizon instance, they wrote in the post."
  ]
  edge [
    source 5
    target 6
    action ""
    sequence 17
    nlp "&#10;        &#8220;The threat actor then executed a series of Linux commands, including attempting to execute a bash-based interactive shell with a hardcoded IP address as well as curl and wget commands in order to retrieve threat-actor tooling hosted on remote infrastructure,&#8221; researchers wrote."
  ]
  edge [
    source 5
    target 14
    action ""
    sequence 42
    nlp "&#10;        &#8220;Based on the telemetry available, OverWatch believes these files likely constituted a reverse shell, which was loaded into memory via DLL search-order hijacking,&#8221; researchers wrote."
  ]
  edge [
    source 6
    target 3
    action ""
    sequence 18
    nlp "&#10;        &#8220;The threat actor then executed a series of Linux commands, including attempting to execute a bash-based interactive shell with a hardcoded IP address as well as curl and wget commands in order to retrieve threat-actor tooling hosted on remote infrastructure,&#8221; researchers wrote."
  ]
  edge [
    source 7
    target 8
    action ""
    sequence 24
    nlp "They triaged the initial activity and immediately sent a critical detection to the victim organization, later sharing additional details directly with their security team, they said."
  ]
  edge [
    source 8
    target 13
    action ""
    sequence 9
    nlp "&#10;        The Falcon OverWatch team noticed the Aquatic Panda intrusion when the threat actor performed multiple connectivity checks via DNS lookups for a subdomain under network, executed under the Apache Tomcat service running on the VMware Horizon instance, they wrote in the post."
  ]
  edge [
    source 9
    target 10
    action ""
    sequence 25
    nlp "&#10;        Eventually, researchers assessed that a modified version of the Log4j exploit was likely used during the course of the threat actor&#8217;s operations, and that the infrastructure used in the attack is linked to Aquatic Panda, they said."
  ]
  edge [
    source 9
    target 2
    action ""
    sequence 6
    nlp "Recently, VMware also issued guidance that some components of its Horizon service are vulnerable to Log4j exploits, leading OverWatch to add the VMware Horizon Tomcat web server service to their processes-to-watch list, researchers said."
  ]
  edge [
    source 10
    target 3
    action ""
    sequence 26
    nlp "&#10;        Eventually, researchers assessed that a modified version of the Log4j exploit was likely used during the course of the threat actor&#8217;s operations, and that the infrastructure used in the attack is linked to Aquatic Panda, they said."
  ]
  edge [
    source 13
    target 3
    action ""
    sequence 27
    nlp "&#10;        OverWatch researchers tracked the threat actor&#8217;s activity closely during the intrusion to provide continuous updates to academic institution as its security administrators scrambled to mitigate the attack, they said."
  ]
  edge [
    source 13
    target 9
    action ""
    sequence 5
    nlp "Recently, VMware also issued guidance that some components of its Horizon service are vulnerable to Log4j exploits, leading OverWatch to add the VMware Horizon Tomcat web server service to their processes-to-watch list, researchers said."
  ]
  edge [
    source 13
    target 16
    action ""
    sequence 40
    nlp "&#10;        &#8220;Based on the telemetry available, OverWatch believes these files likely constituted a reverse shell, which was loaded into memory via DLL search-order hijacking,&#8221; researchers wrote."
  ]
  edge [
    source 14
    target 15
    action ""
    sequence 43
    nlp "&#10;        &#8220;Based on the telemetry available, OverWatch believes these files likely constituted a reverse shell, which was loaded into memory via DLL search-order hijacking,&#8221; researchers wrote."
  ]
  edge [
    source 16
    target 17
    action ""
    sequence 45
    nlp "&#10;        Aquatic Panda eventually made multiple attempts to harvest credentials by dumping the memory of the LSASS process using living-off-the-land binaries executable and executable, a renamed copy of executable."
  ]
  edge [
    source 16
    target 5
    action ""
    sequence 41
    nlp "&#10;        &#8220;Based on the telemetry available, OverWatch believes these files likely constituted a reverse shell, which was loaded into memory via DLL search-order hijacking,&#8221; researchers wrote."
  ]
  edge [
    source 16
    target 3
    action ""
    sequence 39
    nlp "They also retrieved three files with VBS file extensions from remote infrastructure, which they then decoded."
  ]
  edge [
    source 16
    target 11
    action ""
    sequence 29
    nlp "&#10;        Aquatic Panda engaged in reconnaissance from the host, using native OS binaries to understand current privilege levels as well as system and domain details."
  ]
  edge [
    source 18
    target 19
    action ""
    sequence 47
    nlp "&#10;        &#8220;The threat actor used winRAR to compress the memory dump in preparation for exfiltration before attempting to cover their tracks by deleting all executables from the ProgramData and Windows&#9;emp\ directories,&#8221; researchers wrote."
  ]
  edge [
    source 19
    target 3
    action ""
    sequence 48
    nlp "&#10;        &#8220;The threat actor used winRAR to compress the memory dump in preparation for exfiltration before attempting to cover their tracks by deleting all executables from the ProgramData and Windows&#9;emp\ directories,&#8221; researchers wrote."
  ]
  edge [
    source 20
    target 3
    action ""
    sequence 51
    nlp "&#10;        &#8220;The threat actor used winRAR to compress the memory dump in preparation for exfiltration before attempting to cover their tracks by deleting all executables from the ProgramData and Windows&#9;emp\ directories,&#8221; researchers wrote."
  ]
]
