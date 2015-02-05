# coding=utf-8
import datetime
from openerp.osv import fields, osv
from openerp.tools.translate import _
class analytical_timesheet_employees_multi(osv.osv_memory):
    _name = 'hr.analytical.timesheet.users.multi'
    _description = 'Print Multi Employees Timesheet '
    _columns = {
        'month': fields.selection([(1,'January'), (2,'February'), (3,'March'), (4,'April'),
            (5,'May'), (6,'June'), (7,'July'), (8,'August'), (9,'September'),
            (10,'October'), (11,'November'), (12,'December')], 'Month', required=True),
        'year': fields.integer('Year', required=True),
        'public_day_holiday':fields.many2one('hr.holidays.public',string = 'Public Holiday Calendar Year'),
        'employee_ids':fields.many2many('hr.employee','emplyee_hr_multi','wizard_id','employee_id','Employees'),
        'company_id':fields.many2one('res.company',string="Company")
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

        if not data.get('employee_ids',False):
           raise osv.except_osv(_('Error!'),
                                _('Please add atleast one employee'))
           
        data.update( {'organization_unit':self.pool.get('res.company').read(cr,uid,data.get('company_id',False)[0],['organization_unit'],context).get('organization_unit',False)})
        heads = str(data.get('year',False))+ " METŲ " + month_name.get(data.get('month'),"").upper()+ " " + "MĖNESIO DARBO LAIKO APSKAITOS ŽINIARAŠTIS"
        data.update({'heads': unicode(heads, "utf-8")})
        
        datas = {
             'ids': data.get('employee_ids',False),
             'model': 'hr.employee',
             'form': data
                 }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'timesheet_form_report',
            'datas': datas,
            'name':"Timesheet Reports",            
                }

analytical_timesheet_employees_multi()

# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
