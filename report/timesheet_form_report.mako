<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html;">
	<title></title>
	<meta name="generator" content="LibreOffice 4.2.6.3 (Linux)">
	<meta name="author" content="Laurius">
	<meta name="created" content="20040609;10210000000000">
	<meta name="changedby" content="User">
	<meta name="changed" content="20140909;201406000000000">
	<meta charset="UTF-8" >
	<style type="text/css"><!-- 
		body,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:"Courier New Baltic"; font-size:x-small;padding:3px; }
		 -->
.Row
{
    display: table;
    width: 100%; /*Optional*/
    table-layout: fixed; /*Optional*/
}
.Column1
{
	text-align:center;
    display: table-cell;
}
.Column2
{
	text-align:right;
    display: table-cell;
}
	</style>
	
</head>
<body>

<div class="Row">
    <div class="Column"></div>
    <div style = "border-bottom:1px solid #000000;" class="Column1"><font face="Times New Roman" size=3>${data['form']['company_id'][1]}</font></div>
    <div class="Column2"><font face="Times New Roman" size=1>Patvirtinta</font></div>
</div>

<div class="Row">
    <div class="Column"></div>
    <div class="Column1"><font face="Times New Roman">Įmonės, įstaigos, organizacijos pavadinimas</font></div>
    <div class="Column2"><font face="Times New Roman" size=1>Lietuvos Respublikos Vyriausybės</font></div>
</div>

<div class="Row">
    <div class="Column"></div>
    <div style = "border-bottom:1px solid #000000;" class="Column1"><font face="Times New Roman" size=3>${data['form']['organization_unit'] or ""}</font></div>
    <div class="Column2"><font face="Times New Roman" size=1>2004 m. sausio 27 d. nutarimu Nr. 78</font></div>
</div>

<div class="Row">
    <div class="Column"></div>
    <div class="Column1"><font face="Times New Roman">Struktūrinio padalinio pavadinimas</font></div>
    <div class="Column2"><font face="Times New Roman" size=1></font></div>
</div>

<div class="Row">
    <div class="Column"></div>
    <div style = "width:100%" class="Column1"><font face="Times New Roman" size=3><b>${data['form']['heads']}</b></font></div>
    <div class="Column2"><font face="Times New Roman" size=1></font></div>
</div>


<table cellspacing="0" border="0" style="page-break-inside:auto;">
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px " rowspan=5 height="206" align="center" valign=middle><font face="Times New Roman">Eil. Nr.</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px" rowspan=5 align="justify" valign=middle><font face="Times New Roman">Tabe-lio Nr.</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px " rowspan=5 align="center" valign=middle><font face="Times New Roman">Vardas, Pavardė</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px" rowspan=5 align="center" valign=middle><font face="Times New Roman">Profesija (pareigos), kvalifikacinė kategorija</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px " rowspan=5 align="justify" valign=middle><font face="Times New Roman">Numatytas darbo valandų skai    čius per mėn.</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px;border-left: 1px solid #000000;" colspan=31 align="center"><font face="Times New Roman">                   Dienos</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px; border-left: 1px solid #000000; border-right: 1px" colspan=9 align="center"><font face="Times New Roman">Faktiškai dirbta per mėn.</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="center"><font face="Times New Roman">Neatvykimai </font></td>
		</tr>
		<tr colspan="31">
		
		% for i in range(1,32):
<%  
color = ""
dict= get_data(data['form']['month'],data['form']['year'],data['form']['public_day_holiday'])
if dict.get(i,False):
	if "P" in str(dict.get(i,False)) or "W" in str(dict.get(i,False)):
		color = "#FF9900"
	elif "N" in str(dict.get(i,False)) or "S" in str(dict.get(i,False)):
		color = "#FF8080"
%>
					<td  style="border-top: 1px solid #000000; border-left: 1px solid #000000; " rowspan=4   align="center" bgcolor="${color}" valign=middle><b><font face="Times New Roman" color="#000000">${i}</font></b></td>
			%endfor
		
		<td style="border-top: 1px solid #000000; border-bottom: 1px; border-left: 1px solid #000000; border-right: 1px" rowspan=3 align="center" valign=middle><font face="Times New Roman">Dienų</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px" colspan=8 align="center"><font face="Times New Roman">Valandų</font></td>
		<td style="border-bottom: 1px ; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="center"><font face="Times New Roman">į darbą</font></td>
		</tr>
		<tr>
		
		<td style="border-top: 1px solid #000000;border-left: 1px solid #000000; " colspan=8 align="center"><font face="Times New Roman">Iš jų</font></td>
		<td style="border-top: 1px solid #000000;border-left: 1px solid #000000; " rowspan=2 align="center" valign=middle><font face="Times New Roman">Sutartinis žymėjimas</font></td> 
		<td style="border-top: 1px solid #000000;border-left: 1px solid #000000;" rowspan=2 align="center" valign=middle><font face="Times New Roman">Dienų skaičius</font></td>
		<td style="border-top: 1px solid #000000;border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle><font face="Times New Roman">Valandų skaičius</font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000;border-left: 1px solid #000000;" align="justify" valign=middle><font face="Times New Roman">Iš viso</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Naktį</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Viršvalandžių</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Nukrypimai nuo normalių darbo sąlygų</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Budėjimas namuose</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Budėjimas darbe</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Poilsio dienomis</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="justify" valign=middle><font face="Times New Roman">Švenčių dienomis</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">1</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">2</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">3</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">4</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">5</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">6</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">7</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">8</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">9</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">10</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; " align="center" valign=middle><b><font face="Times New Roman">11</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><b><font face="Times New Roman">12</font></b></td>
	</tr> 
	
	
	<% 
	final_total = 0.00
	no = 0
	print "================================the main for loop starts here=====================================" 
	%>
%for o in objects:
<%
dict1 = get_info(o.user_id.id,data['form']['month'],data['form']['year'],data['form']['public_day_holiday'],o.id)
count = dict1.get('count',0)
total  = dict1.get('total',0)
final_total +=total
no = no+1 
%>
	
	<tr>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " height="22" align="center" sdval="5" sdnum="16393;"><font face="Times New Roman">${no}</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center" sdval="27" sdnum="16393;"><font face="Times New Roman">${o.id}</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="left" valign=top><font face="Times New Roman" color="#000000">${o.name}</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="left" valign=top><font face="Times New Roman">${dict1.get('job',"")}</font></td>
		
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"  sdnum="16393;"><b><font face="Times New Roman" size=1>${dict1.get('total',0)}</font></b></td>
		
		<!-- this is the indicator the hours are here -->
		
		% for i in range(1,32):
<%
color = ""
value  = dict1.get('month',False).get(i,0)
if "P" in str(value):
	color = "#FF9900"
	
if "W" in str(value):
	color = "#FF9900"
	value = value.replace('W',"")

if "N" in str(dict.get(i,False)):
	color = "#FF8080" 
	value = value.replace('N',"")

if "S" in str(dict.get(i,False)):
	color = "#FF8080"
	
%>	
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000" align="center" bgcolor="${color}"><b><font face="Times New Roman" size=1 color="#000000">${value}</font></b></td>
		
		<!-- this is where ther hour loop ends -->
		
		%endfor	

		<td style="border-top: 1px solid #000000;border-left: 1px solid #000000; " align="center"  sdnum="16393;"><font face="Times New Roman">${dict1.get('count',0)}</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"  sdnum="16393;"><font face="Times New Roman" size=1>${dict1.get('total',0)}</font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000;" align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000;" align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-top: 1px solid #000000;  border-left: 1px solid #000000; border-right: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
	</tr>
		<%print "*************************************pagebreak",no %>
%endfor	
	<tr>
		<td height="22" align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"> <br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><br></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td align="left" style="border-top: 1px solid #000000;"><font face="Times New Roman"><br></font></td>
		<td style="border-left:1px solid #000000;border-top:1px solid #000000;border-bottom:1px solid #000000;" colspan=5 align="center" ><b><font face="Times New Roman">Iš viso per mėnesį </font></b></td>
		<td style="border-top:1px solid #000000;border-bottom:1px solid #000000;" align="center"  sdnum="16393;"><b><font face="Times New Roman">${final_total}</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000;" align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"><br></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " ></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-top: 1px solid #000000; " align="center"><font face="Times New Roman"></font></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000;border-right: 1px solid #000000;border-top: 1px solid #000000; " align="center" sdval="0" sdnum="16393;"><font face="Times New Roman"></font></td>
	</tr>
		
	<tr>
		<td height="11" align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="center"><font face="Times New Roman"><br></font></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
	</tr>
	<tr>
<%
name = ""
job = "" 
if o.user_id.company_id.employee_id:
	job = o.user_id.company_id.employee_id.job_id.name 
	name =   o.user_id.company_id.employee_id.name
%>
		<td style="border-bottom: 1px solid #000000" colspan=11 height="18" align="center"><i><font face="Times New Roman">${job}</font></i></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td style="border-bottom: 1px solid #000000" colspan=16 align="center"><i><font face="Times New Roman">${name} </font></i></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000" colspan=11 height="18" align="center"><font face="Times New Roman" size=1>(Darbdavio arba jo įgalioto atstovo pareigų pavadinimas)</font></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td style="border-top: 1px solid #000000" colspan=12 align="center"><font face="Times New Roman" size=1>(Parašas)</font></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td style="border-top: 1px solid #000000" colspan=16 align="center"><font face="Times New Roman" size=1>(Vardas ir pavardė)</font></td>
		</tr>
	<tr>
		<td height="18" align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td colspan=2 align="center"><font size=1>A.V.</font></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
	</tr>
	<tr>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
		<td align="left"><br></td>
	</tr>
</table>
<!-- ************************************************************************** -->
</body>

</html>
