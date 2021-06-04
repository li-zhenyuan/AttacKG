import re
import configparser
import json
import spacy
from spacy import Matcher


class IoC_identifier:
    IoC_regex = {
        "NetLoc": [
            r"\b([a-z]{3,}\:\/\/[\S]{16,})\b",
            r"\b(([a-z0-9\-]{2,}\[?\.\]?)+(abogado|ac|academy|accountants|active|actor|ad|adult|ae|aero|af|ag|agency|ai|airforce|al|allfinanz|alsace|am|amsterdam|an|android|ao|aq|aquarelle|ar|archi|army|arpa|as|asia|associates|at|attorney|au|auction|audio|autos|aw|ax|axa|az|ba|band|bank|bar|barclaycard|barclays|bargains|bayern|bb|bd|be|beer|berlin|best|bf|bg|bh|bi|bid|bike|bingo|bio|biz|bj|black|blackfriday|bloomberg|blue|bm|bmw|bn|bnpparibas|bo|boo|boutique|br|brussels|bs|bt|budapest|build|builders|business|buzz|bv|bw|by|bz|bzh|ca|cal|camera|camp|cancerresearch|canon|capetown|capital|caravan|cards|care|career|careers|cartier|casa|cash|cat|catering|cc|cd|center|ceo|cern|cf|cg|ch|channel|chat|cheap|christmas|chrome|church|ci|citic|city|ck|cl|claims|cleaning|click|clinic|clothing|club|cm|cn|co|coach|codes|coffee|college|cologne|com|community|company|computer|condos|construction|consulting|contractors|cooking|cool|coop|country|cr|credit|creditcard|cricket|crs|cruises|cu|cuisinella|cv|cw|cx|cy|cymru|cz|dabur|dad|dance|dating|day|dclk|de|deals|degree|delivery|democrat|dental|dentist|desi|design|dev|diamonds|diet|digital|direct|directory|discount|dj|dk|dm|dnp|do|docs|domains|doosan|durban|dvag|dz|eat|ec|edu|education|ee|eg|email|emerck|energy|engineer|engineering|enterprises|equipment|er|es|esq|estate|et|eu|eurovision|eus|events|everbank|exchange|expert|exposed|fail|farm|fashion|feedback|fi|finance|financial|firmdale|fish|fishing|fit|fitness|fj|fk|flights|florist|flowers|flsmidth|fly|fm|fo|foo|forsale|foundation|fr|frl|frogans|fund|furniture|futbol|ga|gal|gallery|garden|gb|gbiz|gd|ge|gent|gf|gg|ggee|gh|gi|gift|gifts|gives|gl|glass|gle|global|globo|gm|gmail|gmo|gmx|gn|goog|google|gop|gov|gp|gq|gr|graphics|gratis|green|gripe|gs|gt|gu|guide|guitars|guru|gw|gy|hamburg|hangout|haus|healthcare|help|here|hermes|hiphop|hiv|hk|hm|hn|holdings|holiday|homes|horse|host|hosting|house|how|hr|ht|hu|ibm|id|ie|ifm|il|im|immo|immobilien|in|industries|info|ing|ink|institute|insure|int|international|investments|io|iq|ir|irish|is|it|iwc|jcb|je|jetzt|jm|jo|jobs|joburg|jp|juegos|kaufen|kddi|ke|kg|kh|ki|kim|kitchen|kiwi|km|kn|koeln|kp|kr|krd|kred|kw|ky|kyoto|kz|la|lacaixa|land|lat|latrobe|lawyer|lb|lc|lds|lease|legal|lgbt|li|lidl|life|lighting|limited|limo|link|lk|loans|london|lotte|lotto|lr|ls|lt|ltda|lu|luxe|luxury|lv|ly|ma|madrid|maison|management|mango|market|marketing|marriott|mc|md|me|media|meet|melbourne|meme|memorial|menu|mg|mh|miami|mil|mini|mk|ml|mm|mn|mo|mobi|moda|moe|monash|money|mormon|mortgage|moscow|motorcycles|mov|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|nagoya|name|navy|nc|ne|net|network|neustar|new|nexus|nf|ng|ngo|nhk|ni|ninja|nl|no|np|nr|nra|nrw|ntt|nu|nyc|nz|okinawa|om|one|ong|onl|ooo|org|organic|osaka|otsuka|ovh|pa|paris|partners|parts|party|pe|pf|pg|ph|pharmacy|photo|photography|photos|physio|pics|pictures|pink|pizza|pk|pl|place|plumbing|pm|pn|pohl|poker|porn|post|pr|praxi|press|pro|prod|productions|prof|properties|property|ps|pt|pub|pw|qa|qpon|quebec|re|realtor|recipes|red|rehab|reise|reisen|reit|ren|rentals|repair|report|republican|rest|restaurant|reviews|rich|rio|rip|ro|rocks|rodeo|rs|rsvp|ru|ruhr|rw|ryukyu|sa|saarland|sale|samsung|sarl|sb|sc|sca|scb|schmidt|schule|schwarz|science|scot|sd|se|services|sew|sexy|sg|sh|shiksha|shoes|shriram|si|singles|sj|sk|sky|sl|sm|sn|so|social|software|sohu|solar|solutions|soy|space|spiegel|sr|st|style|su|supplies|supply|support|surf|surgery|suzuki|sv|sx|sy|sydney|systems|sz|taipei|tatar|tattoo|tax|tc|td|technology|tel|temasek|tennis|tf|tg|th|tienda|tips|tires|tirol|tj|tk|tl|tm|tn|to|today|tokyo|tools|top|toshiba|town|toys|tp|tr|trade|training|travel|trust|tt|tui|tv|tw|tz|ua|ug|uk|university|uno|uol|us|uy|uz|va|vacations|vc|ve|vegas|ventures|versicherung|vet|vg|vi|viajes|video|villas|vision|vlaanderen|vn|vodka|vote|voting|voto|voyage|vu|wales|wang|watch|webcam|website|wed|wedding|wf|whoswho|wien|wiki|williamhill|wme|work|works|world|ws|wtc|wtf|xyz|yachts|yandex|ye|yoga|yokohama|youtube|yt|za|zm|zone|zuerich|zw))\b",
            r"\b(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\b"],
        "E-mail": [r"\b([a-z][_a-z0-9-.]+@[a-z0-9-]+\.[a-z]+)\b"],
        "FileHash": [
            r"\b([a-f0-9]{32}|[A-F0-9]{32})\b",
            r"\b([a-f0-9]{40}|[A-F0-9]{40})\b",
            r"\b([a-f0-9]{64}|[A-F0-9]{64})\b"
        ],
        "FilePath": [
            r"\b[A-Z]:\\[A-Za-z0-9-_\.\\]+\b",
            # r"[~]*/[A-Za-z0-9-_\./]{2,}\b"
            r"[%A-Za-z0-9]*\\[A-Za-z0-9-_\.\\%]+\b"
        ], # %ALLUSERPROFILE%\Application Data\Microsoft\MediaPlayer\
        # "FileName": [r"\b([A-Za-z0-9-_\.]+\.(exe|dll|bat|sys|htm|html|js|jar|jpg|png|vb|scr|pif|chm|zip|rar|cab|pdf|doc|docx|ppt|pptx|xls|xlsx|swf|gif))\b"],
        "DocFile": [r"\b([A-Za-z0-9-_\.]+\.(sys|htm|html|js|jpg|png|vb|scr|pif|chm|zip|rar|cab|pdf|doc|docx|ppt|pptx|xls|xlsx|swf|gif))\b"],
        "ExeFile": [r"\b([A-Za-z0-9-_\.]+\.(exe|dll|bat|jar))\b"],
        "Vulnerability": [r"\b(CVE\-[0-9]{4}\-[0-9]{4,6})\b"],
        "Registry": [
            r"\b((KCU|HKLM|HKCU|HKEY_LOCAL_MACHINE|HKEY_CURRENT_USER|SOFTWARE).{0,1}\\[\\A-Za-z0-9-_]+)\b",
            r"\b((HKLM|HKCU|HKEY_LOCAL_MACHINE)\\\\[\\\\A-Za-z0-9-_]+)\b"
        ],
        "Arguments": [r"\s[-/\\][0-9a-zA-Z]+\s"]
    }

    IoC_nl_regex = {

    }

    IoC_replacedWord = {
        "NetLoc": "network",
        "E-mail": "email",
        "FileHash": "file",
        "DocFile": "document",
        "ExeFile": "executable",
        "FilePath": "path",
        "Vulnerability": "exploit",
        "Registry": "registry",
        "Arguments": "argument"
    }

    IoC_config_path = r"C:\Users\xiaowan\Documents\GitHub\AttacKG\NLP\ioc_pattern.json" # r"/mnt/c/Users/xiaowan/Documents/GitHub/AttacKG/NLP/ioc_pattern.json"

    # def read_IoC_config(self, path=IoC_config_path):
    #     config = configparser.ConfigParser()
    #     config.read(path)
    #     for s in config.sections():
    #         self.IoC_classes[s] = config.items(s)
    #     return self.IoC_classes

    def write_IoC_regex(self, path=IoC_config_path):
        with open(path, 'w') as json_file:
            json.dump(self.IoC_regex, json_file)

    def IoC_identify(self, sentence):
        output = {"data": sentence, "label": []}
        print(sentence)
        for type, regex_list in self.IoC_regex.items():
            for regex in regex_list:
                while(True):
                    match = re.search(regex, sentence)
                    if match == None:
                        break
                    else:
                        print("Type: %s - %s" % (type, match))
                        output["label"].append([match.span()[0], match.span()[1], type])
                        sentence = re.sub(regex, type, sentence, count=1)
        print(sentence)
        output = json.dumps(output)
        print(output)
        return output

    def batch_IoC_identify_from_file(self, in_file, out_file):
        with open(in_file, "r") as read_file, open(out_file, "w") as write_file:
            for line in read_file:
                # if re.match("[/techniques/T.*]", line) == None:
                #     continue
                # else:
                output = self.IoC_identify(line)
                write_file.write(output + "\n")

    # def regex_based_ner(self):
    #     nlp = spacy.load("en_core_web_sm") #en_core_web_lg
    #     matcher = Matcher(nlp.vocab)
    #     pattern = [{"TEXT": {"REGEX": "[Ee]mail"}}]
    #
    #     pass

if __name__ == '__main__':
    ii = IoC_identifier()
    # ii.write_IoC_regex()
    # ii.IoC_identify("APT29 has exploited CVE-2019-19781 for Citrix, CVE-2019-11510 for Pulse Secure VPNs, CVE-2018-13379 for FortiGate VPNs, and CVE-2019-9670 in Zimbra software to gain access.")
    ii.batch_IoC_identify_from_file(r"C:\Users\xiaowan\Documents\GitHub\AttacKG\NLP\Doccano\technique_examples_withoutTechniqueLabel.txt", r"C:\Users\xiaowan\Documents\GitHub\AttacKG\NLP\Doccano\technique_examples_labeledWithRegex.txt")
