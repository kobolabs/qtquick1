/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

/* A view component for buttons for choosing notes. */
ListView {
    id: noteChooser

    property real currentFrequency: 82.407

    signal noteSelected(string note, real frequency, int index)

    //Press down the button corresponding to the given note.
    function pushButton(index) {
        currentIndex = index;
    }

    width: 50*model.count + spacing*(model.count-1); height: 50
    orientation: ListView.Horizontal
    model: NotesModel {}
    delegate: notesDelegate
    keyNavigationWraps: true
    boundsBehavior: Flickable.StopAtBounds

    Component {
        id: notesDelegate

        ToggleButton {
            id: noteButton

            width: height; height: noteChooser.height
            offImageSource: offSource
            onImageSource: onSource
            state: noteButton.ListView.isCurrentItem ? "pressed" : "unPressed"
            onSelected: {
                noteChooser.noteSelected(note, frequency, index)
                if (note != "Auto") {
                    currentFrequency = frequency
                }
            }
            onPushed: {
                noteButton.ListView.view.currentIndex = index
            }
        }
    }
}