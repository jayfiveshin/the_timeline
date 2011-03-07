// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var current="Expired"
var montharray=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

function countdown(yr,m,d){
	theyear=yr;themonth=m;theday=d
	var today=new Date()
	var todayy=today.getYear()
	if (todayy < 1000)
	todayy+=1900
	var todaym=today.getMonth()
	var todayd=today.getDate()
	var todayh=today.getHours()
	var todaymin=today.getMinutes()
	var todaysec=today.getSeconds()
	var todaystring=montharray[todaym]+" "+todayd+", "+todayy+" "+todayh+":"+todaymin+":"+todaysec
	futurestring=montharray[m-1]+" "+d+", "+yr
	dd=Date.parse(futurestring)-Date.parse(todaystring)
	dday=Math.floor(dd/(60*60*1000*24)*1)
	dhour=Math.floor((dd%(60*60*1000*24))/(60*60*1000)*1)
	dmin=Math.floor(((dd%(60*60*1000*24))%(60*60*1000))/(60*1000)*1)
	dsec=Math.floor((((dd%(60*60*1000*24))%(60*60*1000))%(60*1000))/1000*1)
	if(dday==0&&dhour==0&&dmin==0&&dsec==1){
		document.getElementById('counter').style.display='none';
		document.getElementById('expired').style.display='block';
		return
	}
	else{
		document.getElementById('countdown_day').innerHTML=dday;
		document.getElementById('countdown_hour').innerHTML=dhour;
		document.getElementById('countdown_min').innerHTML=dmin;
		document.getElementById('countdown_sec').innerHTML=dsec;
		setTimeout("countdown(theyear,themonth,theday)",1000)
	}
}