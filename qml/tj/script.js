/**
 * TJ for Sailfish
 * Copyright (c) 2014, Tomi Leppänen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

.pragma library

var saapumiserat = {
    "2013/1": new Era("2013-01-07"),
    "2013/2": new Era("2013-07-08"),
    "2014/1": new Era("2014-01-06"),
    "2014/2": new Era("2014-07-07"),
    "2015/1": new Era("2015-01-05"),
    "2015/2": new Era("2015-07-06"),
    "2016/1": new Era("2016-01-04"),
    "2016/2": new Era("2016-07-04"),
};

var vuosi = null;
var era = null;
var palvelusaika = null;
var tj = null;

function get_saapumisera() {
    return saapumiserat[vuosi.toString() + "/" + era.toString()];
}

function Era(str) {
    var osat = str.split("-");
    for (var osa in osat)
        osat[osa] = parseInt(osat[osa]);
    this.paiva = new Date(osat[0], osat[1] - 1, osat[2], 0, 0, 0, 0);

    this.aloitus_paiva = function() {
        return this.paiva;
    };

    this.lopetus_paiva = function(palvelusaika) {
        var loppu = new Date(this.paiva);
        loppu.setDate(loppu.getDate() + palvelusaika - 1);
        return loppu;
    };

    this.tj = function(palvelusaika) {
        var nyt = new Date();
        var hours = nyt.getHours();
        nyt.setHours(0);
        nyt.setMinutes(0);
        nyt.setSeconds(0);
        nyt.setMilliseconds(0);
        var loppu = this.lopetus_paiva(palvelusaika);
        if (loppu <= nyt)
            return 0;
        if (this.paiva > nyt)
            return palvelusaika;
        var tj = Math.round((loppu - nyt) / (24*60*60*1000));
        if (tj < 0)
            return 0;
        if (hours < 3)
            tj = tj + 1;
        return tj;
    };

    this.palvelusta_kayty = function(palvelusaika, tj) {
        if (tj !== null)
            return palvelusaika - tj;
        return palvelusaika - this.tj();
    };

    this.pokemon = function(tj) {
        if (tj === null)
            tj = this.tj();
        if (tj === 0)
            return "N/A";
        return pokemonit[tj];
    }
}

function set_values(palvelukseenastumispaiva, kotiutumispaiva,
                    tanaan_jaljella, palvelusta_kayty, paivan_pokemon) {
    if (vuosi === null || era === null || palvelusaika === null)
        return;
    var sp = get_saapumisera();
    palvelukseenastumispaiva.value = sp.aloitus_paiva();
    kotiutumispaiva.value = sp.lopetus_paiva(palvelusaika);
    tj = sp.tj(palvelusaika);
    tanaan_jaljella.value = tj;
    palvelusta_kayty.value = sp.palvelusta_kayty(palvelusaika, tj);
    paivan_pokemon.value = sp.pokemon(tj);
}

function get_date_string(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return d + "." + m + "." + y;
}

function get_tj_string() {
    if (tj || tj === 0)
        return tj.toString() + (tj != 1 ? " aamua" : " aamu");
    return "N/A";
}

var pokemonit = [
    null, "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon",
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
