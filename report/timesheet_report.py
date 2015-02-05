# coding=utf-8
import time
from openerp.report import report_sxw
from osv import osv
import datetime
import calendar
class timesheet_report(report_sxw.rml_parse):
    
    def __init__(self, cr, uid, name, context):
        self.id=[]
        self.id=[context.get('active_id',[])]
        super(timesheet_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
                                  'get_data':self.get_data,
                                  'get_length_month':self.lengthmonth,
                                  'get_info':self.get_info,
                                  })
        
    def get_info(self,id,month_id,year,holiday_id,employee_id,context=None):
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
        vals = {}
        cr = self.cr
        employee_obj = self.pool.get('hr.employee').browse(cr,1,employee_id,context)
        if not id:
           raise osv.except_osv(_('Error!'),
                                _('The Employee %s is not related to any user') %(employee_obj.name))
                       
        som = datetime.date(year, month_id, 1)
        eom = som + datetime.timedelta(self.lengthmonth(som.year, som.month))
        cr.execute(
        "select line.date, (unit_amount / unit.factor) as amount "\
        "from account_analytic_line as line, hr_analytic_timesheet as hr, "\
        "product_uom as unit "\
        "where hr.line_id=line.id "\
        "and product_uom_id = unit.id "\
        "and line.user_id=%s and line.date >= %s and line.date < %s "
        "order by line.date",
        (id, som.strftime('%Y-%m-%d'), eom.strftime('%Y-%m-%d')))
        # Sum by day
        month = {}
        for presence in cr.dictfetchall():
            day = int(presence['date'][-2:])
            month[day] = month.get(day, 0.0) + presence['amount']
            month[day] = round(month[day],2)
        total = 0.00
        count = 0
        for i in month:
            total = total + month.get(i,0)
            count+=1
#********************************************************
        holiday_list = []        
        if holiday_id:
            object = self.pool.get('hr.holidays.public.line')
            brw = object.search(cr,1,[('holidays_id','=',holiday_id[0])],context=None)

            for i in brw:
                dates = object.browse(cr,1,i,context=None).date
                dates = datetime.datetime.strptime(dates , '%Y-%m-%d')
                if dates.month == month_id:
                    holiday_list.append(dates.day)
    
#         try:
        for i in range(1,self.lengthmonth(year, month_id)+1):
            value = calendar.weekday(year, month_id, i)
            if i in holiday_list:
                if month.get(i,False):
                    month.update({i:'%sN' %(month.get(i,False))}) 
                else:
                    month.update({i:'S'})
            elif value == 5 or value == 6:
                if month.get(i,False):
                    month.update({i:'%sW' %(month.get(i,False))})                
                else:
                    month.update({i:'P'}) 

#         except ValueError:
#              print "The error was averted in Calendar Weekdays Method"
#********************************************************       
        vals.update({'total':round(total,2),
                     'count':count,
                     'job':employee_obj.job_id.name or "",
                     'company':employee_obj.user_id.company_id.name,
                     'month':month,
                     }) 
        return vals

    def lengthmonth(self,year, month):
        if month == 2 and ((year % 4 == 0) and ((year % 100 != 0) or (year % 400 == 0))):
            return 29
        return [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month]

    
    def get_data(self,month_id,year,holiday_id,context=None):
        cr = self.cr
#         som = datetime.date(year, month_id, 1)
#         eom = som + datetime.timedelta(self.lengthmonth(som.year, som.month))
#         cr.execute(
#         "select line.date, (unit_amount / unit.factor) as amount "\
#         "from account_analytic_line as line, hr_analytic_timesheet as hr, "\
#         "product_uom as unit "\
#         "where hr.line_id=line.id "\
#         "and product_uom_id = unit.id "\
#         "and line.user_id=%s and line.date >= %s and line.date < %s "
#         "order by line.date",
#         (id, som.strftime('%Y-%m-%d'), eom.strftime('%Y-%m-%d')))
#         # Sum by day
#         month = {}
#         for presence in cr.dictfetchall():
#             day = int(presence['date'][-2:])
#             month[day] = month.get(day, 0.0) + presence['amount']
#             
#         # month return a dictionary {3: 30.0, 5: 7.42027777777778}
#         # rounding off the obtained values
#         for i in month:
#             month[i] = round(month[i],2)        
        month = {}
        holiday_list = []        
        if holiday_id:
            object = self.pool.get('hr.holidays.public.line')
            brw = object.search(cr,1,[('holidays_id','=',holiday_id[0])],context=None)

            for i in brw:
                dates = object.browse(cr,1,i,context=None).date
                dates = datetime.datetime.strptime(dates , '%Y-%m-%d')
                if dates.month == month_id:
                    holiday_list.append(dates.day)
    
#         try:
        for i in range(1,self.lengthmonth(year, month_id)+1):
            value = calendar.weekday(year, month_id, i)
            if i in holiday_list:
                if month.get(i,False):
                    month.update({i:'%sN' %(month.get(i,False))}) 
                else:
                    month.update({i:'S'})
            elif value == 5 or value == 6:
                if month.get(i,False):
                    month.update({i:'%sW' %(month.get(i,False))})                
                else:
                    month.update({i:'P'}) 

#         except ValueError:
#              print "The error was averted in Calendar Weekdays Method"
        return month
 
        
report_sxw.report_sxw('report.timesheet_form_report','hr.employee','addons/timesheet_report/report/timesheet_form_report.mako',
    parser=timesheet_report,header=True)


# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
