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

var tj = null;

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
}

function set_values(vuosi, era, palvelusaika, palvelukseenastumispaiva,
                    kotiutumispaiva, tanaan_jaljella) {
    if (vuosi.currentItem === null)
        return;
    var v = vuosi.currentItem.value;
    var e = era.currentItem.value;
    var a = palvelusaika.currentItem.value;
    var sp = saapumiserat[v.toString() + "/" + e.toString()];
    palvelukseenastumispaiva.value = sp.aloitus_paiva();
    kotiutumispaiva.value = sp.lopetus_paiva(a);
    tj = sp.tj(a);
    tanaan_jaljella.value = tj;

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
