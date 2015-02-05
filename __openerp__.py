# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2004-2010 Tiny SPRL (<http://tiny.be>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################
{
    'name' : 'Employee Timesheet Report',
    'version' : '0.1',
    'author' : 'Shivam Goyal',
    'category' : 'Report',
    'description' : """
   """,
    'website': '',
    'images' : [], #'/images/image_name.png'
    'depends' : ['base','hr','hr_public_holidays','report'],#account_analytic_analysis
    'data': ['report/timesheet_report.xml',
             'wizard/hr_analtical_timesheet_user_view.xml',
             'res_company_view.xml','wizard/hr_analytical_timesheet_multi_view.xml','report/timesheet_form_report.xml'
             ],
    'demo': [],
    'test': [],
    'installable': True,
    'auto_install': False,
}
# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4: