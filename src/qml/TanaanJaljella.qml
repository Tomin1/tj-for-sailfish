/**
 * TJ for Sailfish
 * Copyright (c) 2021 Tomi Leppänen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.1
import Nemo.Configuration 1.0

Item {
    property alias vuosi: vuosiValue.value
    property alias era: eraValue.value
    property alias palvelusaika: palvelusaikaValue.value

    readonly property var vuodet: {
        var vuodet = []
        for (var i = 0; i < saapumiserat.count; i++) {
            if (vuodet[vuodet.length - 1] != saapumiserat.get(i).vuosi)
                vuodet[vuodet.length] = saapumiserat.get(i).vuosi
        }
        return vuodet
    }
    readonly property var palvelusajat: [165, 255, 347]
    readonly property var pokemonit: [
        "Ei ole", "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon",
        "Charizard", "Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod",
        "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto",
        "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow", "Ekans", "Arbok",
        "Pikachu", "Raichu", "Sandshrew", "Sandslash", "Nidoran♀", "Nidorina",
        "Nidoqueen", "Nidoran♂", "Nidorino", "Nidoking", "Clefairy", "Clefable",
        "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat",
        "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth",
        "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey",
        "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath",
        "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp",
        "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel",
        "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke",
        "Slowbro", "Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio",
        "Seel", "Dewgong", "Grimer", "Muk", "Shellder", "Cloyster", "Gastly",
        "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby", "Kingler",
        "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak",
        "Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing", "Rhyhorn",
        "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra",
        "Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx",
        "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados",
        "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon",
        "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl", "Snorlax",
        "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite",
        "Mewtwo", "Mew", "Chikorita", "Bayleef", "Meganium", "Cyndaquil",
        "Quilava", "Typhlosion", "Totodile", "Croconaw", "Feraligatr", "Sentret",
        "Furret", "Hoothoot", "Noctowl", "Ledyba", "Ledian", "Spinarak", "Ariados",
        "Crobat", "Chinchou", "Lanturn", "Pichu", "Cleffa", "Igglybuff", "Togepi",
        "Togetic", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos", "Bellossom",
        "Marill", "Azumarill", "Sudowoodo", "Politoed", "Hoppip", "Skiploom",
        "Jumpluff", "Aipom", "Sunkern", "Sunflora", "Yanma", "Wooper", "Quagsire",
        "Espeon", "Umbreon", "Murkrow", "Slowking", "Misdreavus", "Unown",
        "Wobbuffet", "Girafarig", "Pineco", "Forretress", "Dunsparce", "Gligar",
        "Steelix", "Snubbull", "Granbull", "Qwilfish", "Scizor", "Shuckle",
        "Heracross", "Sneasel", "Teddiursa", "Ursaring", "Slugma", "Magcargo",
        "Swinub", "Piloswine", "Corsola", "Remoraid", "Octillery", "Delibird",
        "Mantine", "Skarmory", "Houndour", "Houndoom", "Kingdra", "Phanpy",
        "Donphan", "Porygon2", "Stantler", "Smeargle", "Tyrogue", "Hitmontop",
        "Smoochum", "Elekid", "Magby", "Miltank", "Blissey", "Raikou", "Entei",
        "Suicune", "Larvitar", "Pupitar", "Tyranitar", "Lugia", "Ho-oh", "Celebi",
        "Treecko", "Grovyle", "Sceptile", "Torchic", "Combusken", "Blaziken",
        "Mudkip", "Marshtomp", "Swampert", "Poochyena", "Mightyena", "Zigzagoon",
        "Linoone", "Wurmple", "Silcoon", "Beautifly", "Cascoon", "Dustox", "Lotad",
        "Lombre", "Ludicolo", "Seedot", "Nuzleaf", "Shiftry", "Taillow", "Swellow",
        "Wingull", "Pelipper", "Ralts", "Kirlia", "Gardevoir", "Surskit",
        "Masquerain", "Shroomish", "Breloom", "Slakoth", "Vigoroth", "Slaking",
        "Nincada", "Ninjask", "Shedinja", "Whismur", "Loudred", "Exploud",
        "Makuhita", "Hariyama", "Azurill", "Nosepass", "Skitty", "Delcatty",
        "Sableye", "Mawile", "Aron", "Lairon", "Aggron", "Meditite", "Medicham",
        "Electrike", "Manectric", "Plusle", "Minun", "Volbeat", "Illumise",
        "Roselia", "Gulpin", "Swalot", "Carvanha", "Sharpedo", "Wailmer",
        "Wailord", "Numel", "Camerupt", "Torkoal", "Spoink", "Grumpig", "Spinda",
        "Trapinch", "Vibrava", "Flygon", "Cacnea", "Cacturne", "Swablu", "Altaria",
        "Zangoose", "Seviper", "Lunatone", "Solrock", "Barboach", "Whiscash",
        "Corphish", "Crawdaunt", "Baltoy", "Claydol", "Lileep", "Cradily",
        "Anorith"
    ]

    readonly property int _VRKMS: 24 * 60 * 60 * 1000
    readonly property date palvelukseenastumispaiva: vuosi, era, new Date(etsi(vuosi, era).palvelukseenastumispaiva)
    readonly property date kotiutumispaiva: palvelukseenastumispaiva, palvelusaika, summaa(palvelukseenastumispaiva, palvelusaika)
    readonly property int tj: {
        var nyt = new Date()
        var tunnit = nyt.getHours()
        nyt.setHours(0)
        nyt.setMinutes(0)
        nyt.setSeconds(0)
        nyt.setMilliseconds(0)
        if (kotiutumispaiva <= nyt) {
            return 0
        }
        if (palvelukseenastumispaiva > nyt) {
            return palvelusaika
        }
        var tj = Math.round((kotiutumispaiva - nyt) / _VRKMS)
        if (tj < 0) {
            return 0
        }
        // TODO: Joku säätö aikavyöhykkeiden kanssa, tarkista
        if (tunnit < 3) {
            return tj + 1
        }
        return tj
    }
    readonly property int kayty: palvelusaika - tj
    readonly property string pokemoni: {
        var i = tj
        var nyt = new Date()
        if (nyt > kotiutumispaiva || nyt < palvelukseenastumispaiva)
            i = 0
        return pokemonit[i]
    }

    function etsi(vuosi, era) {
        for (var i = 0; i < saapumiserat.count; i++) {
            if (saapumiserat.get(i).vuosi.toString() == vuosi && saapumiserat.get(i).era.toString() == era) {
                return saapumiserat.get(i)
            }
        }
    }

    function summaa(pvm, paivia) {
        var vastaus = new Date()
        vastaus.setTime(pvm.getTime() + (paivia - 1) * _VRKMS)
        return vastaus
    }

    ListModel {
        id: saapumiserat

        ListElement {
            era: 1
            vuosi: 2019
            palvelukseenastumispaiva: "2019-01-06"
        }

        ListElement {
            era: 2
            vuosi: 2019
            palvelukseenastumispaiva: "2019-07-01"
        }

        ListElement {
            era: 1
            vuosi: 2020
            palvelukseenastumispaiva: "2020-01-06"
        }

        ListElement {
            era: 2
            vuosi: 2020
            palvelukseenastumispaiva: "2020-07-06"
        }

        ListElement {
            era: 1
            vuosi: 2021
            palvelukseenastumispaiva: "2021-01-04"
        }

        ListElement {
            era: 2
            vuosi: 2021
            palvelukseenastumispaiva: "2021-07-05"
        }

        ListElement {
            era: 1
            vuosi: 2022
            palvelukseenastumispaiva: "2022-01-03"
        }

        ListElement {
            era: 2
            vuosi: 2022
            palvelukseenastumispaiva: "2022-07-04"
        }

        ListElement {
            era: 1
            vuosi: 2023
            palvelukseenastumispaiva: "2023-01-02"
        }

        ListElement {
            era: 2
            vuosi: 2023
            palvelukseenastumispaiva: "2023-07-03"
        }

        ListElement {
            era: 1
            vuosi: 2024
            palvelukseenastumispaiva: "2024-07-08"
        }

        ListElement {
            era: 2
            vuosi: 2024
            palvelukseenastumispaiva: "2024-07-08"
        }

        ListElement {
            era: 1
            vuosi: 2025
            palvelukseenastumispaiva: "2025-01-06"
        }

        ListElement {
            era: 2
            vuosi: 2025
            palvelukseenastumispaiva: "2025-07-07"
        }

        ListElement {
            era: 1
            vuosi: 2026
            palvelukseenastumispaiva: "2026-01-05"
        }

        ListElement {
            era: 2
            vuosi: 2026
            palvelukseenastumispaiva: "2026-07-06"
        }
    }

    ConfigurationValue {
        id: vuosiValue
        key: "/apps/tomin/site/TJForSailfish/vuosi"
        defaultValue: (new Date()).getFullYear()
    }

    ConfigurationValue {
        id: eraValue
        key: "/apps/tomin/site/TJForSailfish/era"
        defaultValue: (new Date()).getMonth() < 7 ? 1 : 2
    }

    ConfigurationValue {
        id: palvelusaikaValue
        key: "/apps/tomin/site/TJForSailfish/palvelusaika"
        defaultValue: 347
    }
}
