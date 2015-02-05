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

import datetime
from openerp.osv import fields, osv
from openerp.tools.translate import _
class analytical_timesheet_employees_individual(osv.osv_memory):
    _name = 'hr.analytical.timesheet.users.individual'
    _description = 'Print Employees Timesheet'
    _columns = {
        'month': fields.selection([(1,'January'), (2,'February'), (3,'March'), (4,'April'),
            (5,'May'), (6,'June'), (7,'July'), (8,'August'), (9,'September'),
            (10,'October'), (11,'November'), (12,'December')], 'Month', required=True),
        'year': fields.integer('Year', required=True),
        'public_day_holiday':fields.many2one('hr.holidays.public',string = 'Public Holiday Calendar Year')
                }

    _defaults = {
         'month': lambda *a: datetime.date.today().month,
         'year': lambda *a: datetime.date.today().year,
             }

    def print_report(self, cr, uid, ids, context=None):
        month_name = {1:"Sausis",
                 2:"Vasaris",
                 3:"Kovas",
                 4:"Balandis",
                 5:"Gegužė",
                 6:"Birželis",
                 7:"Liepa",
                 8:"Rugpjūtis",
                 9:"Rugsėjis",
                 10:"Spalis",
                 11:"Lapkritis",
                 12:"Gruodis",
                 }
                
        data = self.read(cr, uid, ids, context=context)[0]
        user = self.pool.get('hr.employee').browse(cr,uid,context.get('active_id',0),context)
        if not user.user_id.id:
            raise osv.except_osv(_('Error!'),
                                _('The Employee is not related to any user'))
        
        data.update( {'organization_unit':self.pool.get('res.company').read(cr,uid,user.company_id.id,['organization_unit'],context).get('organization_unit',False)})
        heads = str(data.get('year',False))+ " METŲ " + month_name.get(data.get('month'),"").upper()+ " " + "MĖNESIO DARBO LAIKO APSKAITOS ŽINIARAŠTIS"
        data.update({'heads': unicode(heads, "utf-8")})
                
        data.update({'ids':user.id})
        data.update({'employee_id':context.get('active_id',0)})
        data.update({'company_id':(user.company_id.id,user.company_id.name or '')})
        datas = {
             'ids': [context.get('active_id',0)],
             'model': 'hr.employee',
             'form': data
                 }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'timesheet_form_report',
            'datas': datas,
            'name':"Timesheet Report",            
                }

analytical_timesheet_employees_individual()

# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
