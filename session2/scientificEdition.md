# Scientific Editions
Ariane Pinche
Warsaw, May 20–24, 2019. 

--- 

Correction

---

## 1-Digital edition and research problematic

- To make a text more accessible to users : [Perseus digital library]( http://www.perseus.tufts.edu/hopper/) 
- To give an accurate version of a document : [Thélème](http://theleme.enc.sorbonne.fr/dossiers/vue1.php) - 
[Chanson d’Otinel](https://dev.chartes.psl.eu/elec/geste/text/urn:cts:froLit:geste.jns11095.transcr_Otin_A/passage/1-99/corpus-de-chansons-de-geste-geste-otinel-otinel-le-romans-do-otinel-transcription-du-temoin-a-ms-reg-lat-1616-de-la-chanson-d-otinel-ed-par-jean-baptiste-camps) 
- To help understand the history of a text : [Madame Bovary](https://www.bovary.fr/folio_visu.php?folio=4541&mode=sequence&mot=)

---
### Some references

- ROBINSON, Peter, « Where We Are with Electronic Scholarly Editions, and Where We Want to Be », *Jahrbuch für Computerphilologie*, vol. 5 / 5, 2003, p. 126‑146.

- PIERAZZO, Elena, *Digital scholarly editing: theories, models and methods*, Farnham Burlington (Vt.), Ashgate, 2015.

---

## 2-Different elements you can encode

2.1 starting elements

- tags set for text structure :
	-  div, p, lg, l
- tags set to add information on persName and placeName :
	 - persName; placeName (+teiHeader)
- tag set to add bibliographic information : 	
	- cit, quote, bibl (+teiHeader)
---

 
## 3-teiHeader and manuscripts

[XML teiHeader](teiHeader.xml)

---

## 4-Exercice

Complete the encoding of  *Sacramenta Argentariae* :

- Add a person names index and link it with the persNames in the text;
- Add information about the layout of the sources (https://tei-c.org/release/doc/tei-p5-doc/en/html/PH.html) and regularisations (graphic and punctuation) (https://tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COED);
- Complete msDesc with information in Gallica.

Link to the manuscript : https://gallica.bnf.fr/ark:/12148/btv1b84238417/f29.item

---
### 4.1 Encoding sources

*Some common tags*

* Abbrevations : `<choice><abbr></abbr><expan><ex></ex></expan></choice>`;
* Regularisations  : `<choice><orig></orig><reg></reg></choice>`;
* Corrections : `<choice><sic></sic><corr></corr></choice>`.

---
## 5- critical apparatus

*First Define what type of apparatus you want to build:*

* **Comprehensive apparatus**: which presents all the variants;

* **Selective apparatus**: which excludes certain types of variants that have no impact on meaning (graphic variants, word separation, punctuation).

---
* Define what kind of presentation you want:

* **Positive Apparatus**, which explicitly records the lessons of each witness with its acronym; the heaviest, but the clearest;

* **Negative Apparatus**, which only includes witnesses whose text differs. All others, which are not reported, are assumed to carry the text retained;
* **Mixed Apparatus**, negative by default which only becomes positive if there is a need for clarification.

---
### TEI XML tags for critical editing

see TEIguidelines, chap. 12 [*Critical Apparatus*] (http://www.tei-c.org/release/doc/tei-p5-doc/en/html/TC.html)

Caution: The method used in the following examples follows the requirements of the *parallel segmentation method*.

`<variantEncoding method =" parallel-segmentation "
  location = "internal" /> `

To go further: Chap 12.2 [http://www.tei-c.org/release/doc/tei-p5-doc/en/html/TC.html#TCAPLK]

---

**Declaration of sources in `<sourceDesc>`:**
* `<listWit>`
* `<witness>`

```XML
<listWit>
  <witness xml:id="C1"> Paris, BnF, ms 412 </ witness>
  <witness xml:id="C2"> Paris, BnF, ms 411 </ witness>
  <witness xml:id="C3"> London, British Library, Royal 20 D. VI. </ witness>
</listWit>
```

---

**Constitution of the critical apparatus (1)**

* `<app>` contains an entry in a critical apparatus, consisting of an optional lemma or at least one lesson;
* `<lem>` contains the lemma.
* `<rdg>` contains a variant / lesson of the text;
```XML
  <app>
<lem wit="# El #Hg"> Experience </lem>
<rdg wit="#The" type="substantive"> Experiment </rdg>
<rdg wit ="#Ra2" type="substantive"> Eryment </rdg>
</app>
```

---
**Constitution of the critical apparatus (2)**

* `<rdgGrp>` groups two or more lessons that are perceived to have a genetic or other affinity relationship;

```XML
<app>
<lem wit="# fr_wit1">comte</lem>
<rdgGrp type="orthographic">
<rdg wit="#fr_wit2"> cante</rdg>
<rdg wit="#fr_wit3"> contes</rdg>
</rdgGrp>
</app>
```
---

## 6-Exercice

- Structure the text of the song I, v.183-222 of the *Pharsalia* (*De Bello civili*) of Lucain;
- Declare in the teiHeader the various witnesses of the tradition of the text of Lucain using the table of acronyms;
- Encode the critical apparatus;
- Use the [TEI Critical Apparatus toolbox] (http://teicat.huma-num.fr) to view your encoding ("check my encoding" - "display parallel versions" - "Print an edition").

--- 
## 7-Hudge corpora

- Choose the more signifiant unit for your XML files;
- Create a corpus for your different files, using teiCorpus : https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-teiCorpus.html 

```XML
<teiCorpus xmlns="http://www.tei-c.org/ns/1.0" >
    <teiHeader>
        <fileDesc>
           <titleStmt>
             <title>Corpus Andria</title>       
             <author>Projet Hyperdonat</author>
                [...]
          </titleStmt>
     </fileDesc>
    </teiHeader>   
    <xi:include href="../witness/wit_A.xml"
                xmlns:xi="http://www.w3.org/2001/XInclude"/>
    <xi:include href="../witness/wit_M.xml"
                xmlns:xi="http://www.w3.org/2001/XInclude"/>
    <xi:include href="../witness/wit_U.xml"
                xmlns:xi="http://www.w3.org/2001/XInclude"/>   
</teiCorpus>
```