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

function getDb(LS) {
    return LS.openDatabaseSync("TJ", "1.0", "SettingsDatabase", 1000);
}

function init(LS) {
    var db = getDb(LS);
    db.transaction(function(cur) {
        cur.executeSql(
            "CREATE TABLE IF NOT EXISTS settings(setting TEXT UNIQUE, value TEXT);"
        );
    });
}

function set(LS, setting, value) {
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
    var db = getDb(LS);
    var result = "";
    db.transaction(function(cur) {
        var rs = cur.executeSql(
            "SELECT value FROM settings WHERE setting=?;", [setting]
        );
        if (rs.rows.length > 0)
            result = rs.rows.item(0).value;
        else
            result = false;
    });
    return result;
}
