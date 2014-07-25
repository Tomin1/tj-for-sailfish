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

var defaults = {
    'vuosi': (new Date()).getFullYear(),
    'era': ((new Date()).getMonth() < 6 ? 0 : 1),
    'palvelusaika': 165
}

function getDb(LS) {
    return LS.openDatabaseSync("TJ", "1.0", "SettingsDatabase", 1000);
}

var init_done = false;
function init(LS) {
    if (init_done)
        return;
    var db = getDb(LS);
    db.transaction(function(cur) {
        cur.executeSql(
            "CREATE TABLE IF NOT EXISTS settings(setting TEXT UNIQUE, value TEXT);"
        );
    });
    init_done = true;
}

function set(LS, setting, value) {
    init(LS);
    var db = getDb(LS);
    var result = "";
    db.transaction(function(cur) {
        var rs = cur.executeSql(
            "INSERT OR REPLACE INTO settings VALUES (?, ?);", [setting, value]
        );
        if (rs.rowsAffected > 0)
            result = true;
        else
            result = false;
    });
    return result;
}

function get(LS, setting) {
    init(LS);
    var db = getDb(LS);
    var result = "";
    db.transaction(function(cur) {
        var rs = cur.executeSql(
            "SELECT value FROM settings WHERE setting=?;", [setting]
        );
        if (rs.rows.length > 0)
            result = parseInt(rs.rows.item(0).value);
        else
            result = defaults[setting];
    });
    return result;
}
