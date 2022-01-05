Tänään jäljellä -laskuri Sailfish-käyttöjärjestelmälle
======================================================
For English readme, see [README.en.md](README.en.md).

Tämä on aamukampasovellus Sailfish-käyttöjärjestelmälle. Se tukee mm. seuraavia ominaisuuksia:
 - Näyttää palvelukseenastumispäivän, kotiutumispäivän ja aamujen määrän sekä päivän pokemonin
 - Cover, jossa aamujen määrä

***Etsin uutta ylläpitäjää sovellukselle. Jos olet kiinnostunut, laita viestiä vaikkapa
sähköpostilla. Suurin tarve on ylläpitää listaa palveluseristä, mutta uusiakin ominaisuuksia voi
miettiä. Siirrän myös Harbour-sovelluksen hallinnan uudelle ylläpitäjälle.***

Usein kysytyt kysymykset
------------------------
Tässä vastauksia joihinkin kysyttyihin kysymyksiin.

### Miksi sovellusta ei ole saatavilla esimerkiksi englanniksi tai ruotsiksi?
En ole selvittänyt erilaisten käytettyjen termien nimiä englanniksi tai ruotsiksi, joten
käännöksille ei ole ollut tarvetta.

### Miksi koodissa on suomea? Eikö se ole huono tapa?
No joo. Onhan se sitäkin. Tässä on sama syy kuin ylemmässä eli en ole viitsinyt selvittää termejä
englanniksi, joten koodissa käytetyt muuttujat ovat sekakielisiä. Olisihan se kivempi, jos koodi
olisi yhtenäistä.

Oman version kääntäminen
------------------------
Tämä onnistuu helposti [Sailfish SDK:n](https://sailfishos.org/wiki/Sailfish_SDK) sfdk-komennolla.
Valitse ensin haluttu target:

    sfdk config --push target SailfishOS-4.1.0.24-i486

Ja käännä paketti:

    sfdk build

Asenna luotu paketti laitteellesi.

Lisenssi
--------
Kaikki koodi on GNU General Public License versio 3. Lue [COPYING](COPYING)-tiedosto koko lisenssiä
varten.

Kuvake on tehty Sailfishin kuvakepohjaa muokkaamalla.
