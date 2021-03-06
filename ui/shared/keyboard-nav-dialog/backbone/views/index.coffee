#
# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

import {useScope as useI18nScope} from '@canvas/i18n'
import {View} from '@canvas/backbone'
import $ from 'jquery'
import 'jqueryui/dialog'

I18n = useI18nScope('KeyboardNavDialog')

export default class KeyboardNavDialog extends View

  el: '#keyboard_navigation'

  initialize: ->
    super
    @bindOpenKeys
    @

  # you're responsible for rendering the content via HB
  # and passing it in
  render: (html) ->
    @$el.html(html)
    @

  bindOpenKeys: ->
    activeElement = null
    $(document).keydown((e) =>
      isQuestionMark = e.keyCode == 191 && e.shiftKey
      if (isQuestionMark && !$(e.target).is(":input") && !ENV.disable_keyboard_shortcuts)
        e.preventDefault()
        if(@$el.is(":visible"))
          @$el.dialog("close")
          if(activeElement)
            $(activeElement).focus()
        else
          activeElement = document.activeElement

          @$el.dialog(
            title: I18n.t 'titles.keyboard_shortcuts', "Keyboard Shortcuts"

            width: 400

            height: "auto"

            close: ->
              $("li", @).attr("tabindex", "") # prevents chrome bsod
              if(activeElement)
                $(activeElement).focus()
          )
      )

