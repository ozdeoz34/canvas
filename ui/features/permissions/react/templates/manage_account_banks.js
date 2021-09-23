/*
 * Copyright (C) 2021 - present Instructure, Inc.
 *
 * This file is part of Canvas.
 *
 * Canvas is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, version 3 of the License.
 *
 * Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import I18n from 'i18n!permissions_templates_12'
import {generateActionTemplates} from '../generateActionTemplates'

export const template = generateActionTemplates(
  [
    {
      title: I18n.t('Item Banks'),
      description: I18n.t('Allows user to view all item banks in the account.')
    },
    {
      description: I18n.t('Allows user to view all item banks in a course.')
    }
  ],
  [
    {
      title: I18n.t('Item Banks'),
      description: I18n.t(
        'If this permission is not enabled, users can view item banks created by them, shared with them from another user, or shared indirectly via the course where they are enrolled with an instructor role.'
      )
    }
  ],
  [
    {
      title: I18n.t('Item Banks'),
      description: I18n.t('Allows user to view all item banks in a course.')
    }
  ],
  [
    {
      title: I18n.t('Item Banks'),
      description: I18n.t(
        'If this permission is not enabled, users can view item banks created by them, shared with them from another user, or shared indirectly via the course where they are enrolled with an instructor role.'
      )
    }
  ]
)