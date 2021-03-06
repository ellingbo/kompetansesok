Egenskap: Søk
  For å kunne markere læremidler
  Må lærere, bibliotekarer og forleggere
  kunne søke etter kompetansemål
  
  Scenario: Tomt søk
    Gitt at jeg er på hovedsiden
    Når jeg søker etter ""
    Så skal jeg ikke få noen treff
    Og jeg skal se "Vennligst angi et søkekriterium"

  Scenario: Beholde søkestreng i søkefelt
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "mitt søk"
    Så skal det stå "mitt søk" i søkefeltet

  Scenario: For mange treff (med visning av kompetansemål)
    Gitt at jeg er på hovedsiden
    Og jeg har markert følgende:
      | kompetansemaal |
      | true           |
    Når jeg søker etter "engelsk"
    Så skal jeg få advarsel om at søket er for grovt

  Scenario: For mange treff (uten visning av kompetansemål)
    Gitt at jeg er på hovedsiden
    Og jeg har markert følgende:
      | kompetansemaal |
      | false          |
    Når jeg søker etter "engelsk"
    Så skal jeg ikke få advarsel om at søket er for grovt
  
  Scenario: Få 9 treff i kompetansemål på "samisk kultur"
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "'samisk kultur'"
    Så skal jeg få opp følgende treff i kompetansemål:
      | Tittel starter med                           |
      | beskrive særtrekk ved bygninger              |
      | diskutere hovedtrekk og variasjoner i samisk |
      | fortelle om sentrale trekk ved samisk        |
      | gjere greie for visuelle uttrykk og          |
      | gjøre rede for visuelle uttrykk og           |
      | observere og beskrive årstidene, døgn        |
      | presentere hovudtrekk ved samisk kultur      |
      | sammenligne levesett og omgangsformer        |
      | samtale om utviklingen av samisk kultur      |
    Og jeg skal ikke se "Vennligst angi et søkekriterium"

  Scenario: Få 1 treff i kompetansemål på "gjeldende prosedyrer og regelverk"
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "gjeldende prosedyrer og regelverk"
    Så skal jeg få opp følgende treff i kompetansemål:
      | Tittel starter med                           |
      | utføre arbeid i tråd med gjeldende prosedyrer|

  Scenario: Få 1 treff i læreplaner på "ambulansefaget"
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "ambulansefaget"
    Så skal jeg få opp følgende treff for Laereplan:
      | Tittel                                              |
      | AMB3-01: Læreplan i ambulansefaget Vg3 / opplæring i bedrift |

  Scenario: Få 5 treff i hovedområder på "marked"
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "marked"
    Så skal jeg få opp følgende treff for Hovedomraade:
      | Tittel                 |
      | Bedrift, kunde, marked |
      | Marked og målgrupper   |
      | Marked og økonomi      |
      | Strategi og marked     |
      | Økonomi og marked      |
      
  Scenario: Få 3 treff i kompetansemaalsett på "anlegg"
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "anlegg"
    Så skal jeg få opp følgende treff for Kompetansemaalsett:
      | Tittel                 |
      | Anlegg og teknikk      |

  Scenario: Få 3 treff i kompetansemaalsett på "ambulanse"
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "ambulansemedisin"
    Så skal jeg få opp følgende treff for Fag:
      | Tittel                    |
      | AMB2Z02: Ambulansemedisin |

  Scenario: Søke kun på Læreplaner
    Gitt at jeg er på hovedsiden
    Og jeg har markert følgende:
      | kompetansemaal | laereplaner | hovedomraader |
      | true           | false       | true          |
    Når jeg søker etter "hva som helst"
    Så skal filtreringsboksene vise seksjoner:
      | kompetansemaal | laereplaner | hovedomraader |
      | true           | false       | true          |

  Scenario: Se standard filtering
    Gitt at jeg er på hovedsiden
    Så skal filtreringsboksene vise seksjoner:
      | kompetansemaal | laereplaner | hovedomraader |
      | true           | true        | true          |

  Scenario: Kunne søke med '*' som wildcard
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "NOR6*"
    Så skal jeg få opp følgende treff for Laereplan:
      | Tittel                        |
      | NOR6-01: Læreplan i fordypning i norsk |

  Scenario: Kunne søke etter flere verider separert med semikolon
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "NOR6-01; FOR6-01"
    Så skal jeg få opp følgende treff for Laereplan:
      | Tittel                                                                                                                                       |
      | NOR6-01: Læreplan i fordypning i norsk                                                                                                       |
      | FOR6-01: Læreplan i samisk visuell kultur - valfritt programfag i studiespesialiserande utdanningsprogram, programområde for formgjevingsfag |

   Scenario: Vise antall treff
    Gitt at jeg er på hovedsiden
    Når jeg søker etter "engelsk"
    Så skal jeg få følgende antall treff:
      | Type              | Antall |
      | Kompetansemål     | 101    |
      | Læreplaner        | 4      |
      | Hovedområder      | 0      |
      | Kompetansemålsett | 2      |
      | Fag               | 13     |
