/*
 * Copyright (c) 2010-2020 Belledonne Communications SARL.
 *
 * This file is part of linphone-desktop
 * (see https://www.linphone.org).
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
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
// =============================================================================
// Windows (qml) Logic.
// =============================================================================

.import 'qrc:/ui/scripts/Utils/utils.js' as Utils

// =============================================================================

// Create a dynamic component hover the main content of one window.
// The object parameter must have a `exitStatus` signal which is used
// at item destruction.
//
// The exit status handler is optional.
function attachVirtualWindow (component, properties, exitStatusHandler) {
    return virtualWindow.setContent(component, properties, exitStatusHandler);
}

function detachVirtualWindow () {
  if( virtualWindow.active)
    virtualWindow.unsetContent();
}
