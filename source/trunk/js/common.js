
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_openBrWindow(theURL,winName,features) {
	window.open(theURL,winName,features);
}

function mmLoadMenus() 
{
	if (window.fw_menu_0) return;
		window.fw_menu_0 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_0.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiGold","location='/web/vn/products/tariff_g.jsp'");
	fw_menu_0.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiCard","location='/web/vn/products/tariff_c.jsp'");
	fw_menu_0.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiPlay","location='/web/vn/products/tariff_play.jsp'");
	fw_menu_0.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c Mobi4U","location='/web/vn/products/tariff_u.jsp'");
	fw_menu_0.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiQ","location='/web/vn/products/tariff_q.jsp'");
	fw_menu_0.hideOnMouseOut=true;
	fw_menu_0.bgColor='#DFDFDF';
	fw_menu_0.menuBorder=1;
	fw_menu_0.menuLiteBgColor='#FFFFFF';
	fw_menu_0.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_1) return;
		window.fw_menu_1 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_1.addMenuItem("B&#7843;n tin công ngh&#7879;","location='/web/vn/news/index.jsp?cate=1'");
	fw_menu_1.addMenuItem("S&#7843;n ph&#7849;m m&#7899;i","location='/web/vn/news/index.jsp?cate=2'");
	fw_menu_1.addMenuItem("Kinh nghi&#7879;m","location='/web/vn/news/index.jsp?cate=3'");
	fw_menu_1.addMenuItem("Hacker &amp; Virus","location='/web/vn/news/index.jsp?cate=4'");
	fw_menu_1.addMenuItem("Chuy&#7879;n c&#432;&#7901;i","location='/web/vn/news/index.jsp?cate=5'");
	fw_menu_1.hideOnMouseOut=true;
	fw_menu_1.bgColor='#DFDFDF';
	fw_menu_1.menuBorder=1;
	fw_menu_1.menuLiteBgColor='#FFFFFF';
	fw_menu_1.menuBorderBgColor='#C5C5C5';


	if (window.fw_menu_2) return;
		window.fw_menu_2 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_2.addMenuItem("Gi&#7899;i thi&#7879;u ch&#432;&#417;ng trình","location='/web/vn/news/index.jsp?cate=1'");
	fw_menu_2.addMenuItem("Tra c&#7913;u &#273;i&#7875;m s&#7889;","location='/web/vn/news/index.jsp?cate=2'");
	fw_menu_2.addMenuItem("Tra c&#7913;u chi ti&#7871;t &#273;i&#7875;m","location='/web/vn/news/index.jsp?cate=3'");
	fw_menu_2.addMenuItem("Tra c&#7913;u l&#7883;ch s&#7917; x&#7871;p h&#7841;ng","location='/web/vn/news/index.jsp?cate=4'");
	fw_menu_2.addMenuItem("Tra c&#7913;u quá trình trao gi&#7843;i","location='/web/vn/news/index.jsp?cate=5'");	
	fw_menu_2.hideOnMouseOut=true;
	fw_menu_2.bgColor='#DFDFDF';
	fw_menu_2.menuBorder=1;
	fw_menu_2.menuLiteBgColor='#FFFFFF';
	fw_menu_2.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_3) return;
		window.fw_menu_3 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_3.addMenuItem("Mi&#7873;n B&#7855;c","location='/web/vn/everything/danh_sach_cua_hang_TT1.htm'");
	fw_menu_3.addMenuItem("Mi&#7873;n Trung","location='/web/vn/everything/danh_sach_cua_hang_TT3.htm'");
	fw_menu_3.addMenuItem("Mi&#7873;n Nam","location='/web/vn/everything/danh_sach_cua_hang_TT2.htm'");
	fw_menu_3.addMenuItem("Mi&#7873;n Tây","location='/web/vn/everything/danh_sach_cua_hang_TT4.htm'");	
	fw_menu_3.hideOnMouseOut=true;
	fw_menu_3.bgColor='#DFDFDF';
	fw_menu_3.menuBorder=1;
	fw_menu_3.menuLiteBgColor='#FFFFFF';
	fw_menu_3.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_4) return;
		window.fw_menu_4 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_4.addMenuItem("GSM","location='/web/vn/home/coverage.jsp?centerId=101'");
	fw_menu_4.addMenuItem("GPRS/MMS","location='/web/vn/home/coverage_gprs.jsp'");	
	fw_menu_4.hideOnMouseOut=true;
	fw_menu_4.bgColor='#DFDFDF';
	fw_menu_4.menuBorder=1;
	fw_menu_4.menuLiteBgColor='#FFFFFF';
	fw_menu_4.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_calendar) return;
		window.fw_menu_calendar = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_calendar.addMenuItem("T&#7915;ng ngày","location='/web/vn/calendar/calendar.jsp'");
	fw_menu_calendar.addMenuItem("Hàng ngày","location='/web/vn/calendar/calendar_daily.jsp'");
	fw_menu_calendar.addMenuItem("Hàng tu&#7847;n","location='/web/vn/calendar/calendar_weekly.jsp'");
	fw_menu_calendar.addMenuItem("Hàng tháng","location='/web/vn/calendar/calendar_monthly.jsp'");
	fw_menu_calendar.addMenuItem("Hàng n&#259;m","location='/web/vn/calendar/calendar_annually.jsp'");
	fw_menu_calendar.addMenuItem("Truy c&#7853;p b&#7857;ng WAP","location='/web/vn/calendar/wap_doc.jsp'");	
	fw_menu_calendar.hideOnMouseOut=true;
	fw_menu_calendar.bgColor='#DFDFDF';
	fw_menu_calendar.menuBorder=1;
	fw_menu_calendar.menuLiteBgColor='#FFFFFF';
	fw_menu_calendar.menuBorderBgColor='#C5C5C5';	
	

	if (window.fw_menu_addressbook) return;
		window.fw_menu_addressbook = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_addressbook.addMenuItem("Nhóm s&#7893; &#273;&#7883;a ch&#7881;","location='/web/vn/addressbook/group.jsp'");
	fw_menu_addressbook.addMenuItem("Download s&#7893; &#273;&#7883;a ch&#7881;","location='/web/vn/addressbook/downloadAddress.jsp'");
	fw_menu_addressbook.addMenuItem("Upload s&#7893; &#273;&#7883;a ch&#7881;","location='/web/vn/addressbook/uploadAddress.jsp'");
	fw_menu_addressbook.addMenuItem("Truy c&#7853;p b&#7857;ng WAP","location='/web/vn/addressbook/wap_doc.jsp'");
	fw_menu_addressbook.hideOnMouseOut=true;
	fw_menu_addressbook.bgColor='#DFDFDF';
	fw_menu_addressbook.menuBorder=1;
	fw_menu_addressbook.menuLiteBgColor='#FFFFFF';
	fw_menu_addressbook.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_sms) return;
		window.fw_menu_sms = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_sms.addMenuItem("Tin nh&#7855;n vui","location='/web/vn/sms/smsFun.jsp'");
	fw_menu_sms.addMenuItem("B&#7843;n tin m&#7851;u","location='/web/vn/sms/smsTpl.jsp'");
	fw_menu_sms.addMenuItem("G&#7917;i tin nh&#7855;n t&#7899;i Email","location='/web/vn/sms/sms2email.jsp'");
	fw_menu_sms.addMenuItem("T&#7915; &#273;i&#7875;n tin nh&#7855;n","location='/web/vn/sms/smsDictionary.jsp'");
	fw_menu_sms.addMenuItem("Cài &#273;&#7863;t d&#7883;ch v&#7909; SMS","location='/web/vn/sms/smsSetup.jsp'");
	fw_menu_sms.addMenuItem("Spam SMS","location='/web/vn/sms/smsSpam.jsp'");
	fw_menu_sms.addMenuItem("G&#7917;i tin nh&#7855;n t&#7899;i danh sách","location='/web/vn/sms/CSVsms.jsp'");
	fw_menu_sms.hideOnMouseOut=true;
	fw_menu_sms.bgColor='#DFDFDF';
	fw_menu_sms.menuBorder=1;
	fw_menu_sms.menuLiteBgColor='#FFFFFF';
	fw_menu_sms.menuBorderBgColor='#C5C5C5';

	
	if (window.fw_menu_loyalty) return;
		window.fw_menu_loyalty = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_loyalty.addMenuItem("Gi&#7899;i thi&#7879;u v&#7873; ch&#432;&#417;ng trình","location='/web/vn/loyalty/about.jsp'");
	fw_menu_loyalty.addMenuItem("Tra c&#7913;u &#273;i&#7875;m s&#7889;","location='/web/vn/loyalty/displaymark.jsp'");
	fw_menu_loyalty.addMenuItem("Tra c&#7913;u chi ti&#7871;t &#273;i&#7875;m","location='/web/vn/loyalty/markdetail.jsp'");
	fw_menu_loyalty.addMenuItem("Tra c&#7913;u l&#7883;ch s&#7917; x&#7871;p h&#7841;ng","location='/web/vn/loyalty/rankhistory.jsp'");
	fw_menu_loyalty.addMenuItem("Tra c&#7913;u quá trình trao gi&#7843;i","location='/web/vn/loyalty/rwdhistory.jsp'");	
	fw_menu_loyalty.hideOnMouseOut=true;
	fw_menu_loyalty.bgColor='#DFDFDF';
	fw_menu_loyalty.menuBorder=1;
	fw_menu_loyalty.menuLiteBgColor='#FFFFFF';
	fw_menu_loyalty.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_album) return;
		window.fw_menu_album = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_album.addMenuItem("T&#7841;o album","location='/web/vn/pictureGallery/indexCreateAlbum.jsp'");
	fw_menu_album.addMenuItem("Thêm &#7843;nh","location='/web/vn/pictureGallery/indexUpload.jsp'");
	fw_menu_album.addMenuItem("Thùng rác","location='/web/vn/pictureGallery/indexBin.jsp'");
	fw_menu_album.hideOnMouseOut=true;
	fw_menu_album.bgColor='#DFDFDF';
	fw_menu_album.menuBorder=1;
	fw_menu_album.menuLiteBgColor='#FFFFFF';
	fw_menu_album.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_ota) return;
		window.fw_menu_ota = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_ota.addMenuItem("&#272;&#259;ng ký s&#7917; d&#7909;ng GPRS","location='/web/vn/ota/indexGPRS.jsp'");	
	fw_menu_ota.addMenuItem("Cài &#273;&#7863;t WAP","location='/web/vn/ota/indexProducerWap.jsp'");		
	fw_menu_ota.addMenuItem("Cài &#273;&#7863;t MMS","location='/web/vn/ota/indexProducerMMS.jsp'");
	fw_menu_ota.addMenuItem("Cài &#273;&#7863;t Email","location='/web/vn/ota/indexModelEmail.jsp'");	
	fw_menu_ota.addMenuItem("H&#7895; tr&#7907;","location='/web/vn/ota/indexSupport.jsp'");
	fw_menu_ota.hideOnMouseOut=true;
	fw_menu_ota.bgColor='#DFDFDF';
	fw_menu_ota.menuBorder=1;
	fw_menu_ota.menuLiteBgColor='#FFFFFF';
	fw_menu_ota.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_subcriber) return;
		window.fw_menu_subcriber = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_subcriber.addMenuItem("Tra c&#7913;u thông tin thuê bao","location='/web/vn/selfcare/checkProfile.jsp'");
	fw_menu_subcriber.addMenuItem("Các d&#7883;ch v&#7909; ti&#7879;n ích","location='/web/vn/selfcare/service.jsp'");
	fw_menu_subcriber.addMenuItem("Thông báo c&#432;&#7899;c","location='/web/vn/selfcare/checkBill.jsp'");	
	fw_menu_subcriber.addMenuItem("Xem chi ti&#7871;t c&#432;&#7899;c","location='/web/vn/selfcare/checkBillDetails.jsp'");
	fw_menu_subcriber.addMenuItem("Thông tin c&#432;&#7899;c phát sinh","location='/web/vn/selfcare/checkCreatedBill.jsp'");
	fw_menu_subcriber.addMenuItem("L&#7883;ch s&#7917; thuê bao","location='/web/vn/selfcare/checkHistory.jsp'");
	fw_menu_subcriber.hideOnMouseOut=true;
	fw_menu_subcriber.bgColor='#DFDFDF';
	fw_menu_subcriber.menuBorder=1;
	fw_menu_subcriber.menuLiteBgColor='#FFFFFF';
	fw_menu_subcriber.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_services) return;
		window.fw_menu_services = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_services.addMenuItem("LiveScore","location='/web/vn/livescore/'");
	fw_menu_services.addMenuItem("USSD","location='/web/vn/services/#'");
	fw_menu_services.addMenuItem("H&#7897;p th&#432; tho&#7841;i","location='/web/vn/services/#'");
	fw_menu_services.addMenuItem("Thông tin b&#7857;ng tin nh&#7855;n","location='/web/vn/services/#'");	
	fw_menu_services.addMenuItem("8xxx","location='/web/vn/services/8xxx.jsp'");
	fw_menu_services.hideOnMouseOut=true;
	fw_menu_services.bgColor='#DFDFDF';
	fw_menu_services.menuBorder=1;
	fw_menu_services.menuLiteBgColor='#FFFFFF';
	fw_menu_services.menuBorderBgColor='#C5C5C5';


	if (window.fw_menu_news) return;
		window.fw_menu_news = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_news.addMenuItem("Tin t&#7913;c và S&#7921; ki&#7879;n","location='/web/vn/home/news.jsp'");
	fw_menu_news.addMenuItem("Khuy&#7871;n m&#7841;i","location='/web/vn/home/promotion.jsp'");	
	fw_menu_news.hideonMouseOut=true;
	fw_menu_news.bgColor='#DFDFDF';
	fw_menu_news.menuBorder=1;
	fw_menu_news.menuLiteBgColor='#FFFFFF';
	fw_menu_news.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_distribute) return;
		window.fw_menu_distribute = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_distribute.addMenuItem("64 t&#7881;nh thành","location='/web/vn/home/distribute_system.jsp'");
	fw_menu_distribute.addMenuItem("&#272;&#7841;i lý login","location='/web/vn/home/#'");	
	fw_menu_distribute.hideonMouseOut=true;
	fw_menu_distribute.bgColor='#DFDFDF';
	fw_menu_distribute.menuBorder=1;
	fw_menu_distribute.menuLiteBgColor='#FFFFFF';
	fw_menu_distribute.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_roaming) return;
		window.fw_menu_roaming = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_roaming.addMenuItem("Gi&#7899;i thi&#7879;u","location='/web/vn/everything/vn_roaming.jsp'");
	fw_menu_roaming.addMenuItem("H&#432;&#7899;ng d&#7851;n","location='/web/vn/everything/vn_roaming_user_guide.jsp'");	
	fw_menu_roaming.addMenuItem("Danh sách các m&#7841;ng","location='/web/vn/everything/partners.jsp'");
	fw_menu_roaming.hideonMouseOut=true;
	fw_menu_roaming.bgColor='#DFDFDF';
	fw_menu_roaming.menuBorder=1;
	fw_menu_roaming.menuLiteBgColor='#FFFFFF';
	fw_menu_roaming.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_money) return;
		window.fw_menu_money = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_money.addMenuItem("Th&#7867; gi&#7845;y","location='/web/vn/home/thanhtoan_atm.jsp'");
	fw_menu_money.addMenuItem("MobiEZ","location='/web/vn/mobiEz/'");	
	fw_menu_money.addMenuItem("Mã th&#7867;","location='/web/vn/home/thanhtoan_atm.jsp'");
	fw_menu_money.hideonMouseOut=true;
	fw_menu_money.bgColor='#DFDFDF';
	fw_menu_money.menuBorder=1;
	fw_menu_money.menuLiteBgColor='#FFFFFF';
	fw_menu_money.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_sim) return;
		window.fw_menu_sim = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_sim.addMenuItem("SuperSIM","location='/web/vn/everything/supersim.jsp'");
	fw_menu_sim.addMenuItem("Sim 128K","location='/web/vn/everything/supersim128k.jsp'");	
	fw_menu_sim.addMenuItem("Sim 32K","location='/web/vn/everything/supersim128k.jsp'");
	fw_menu_sim.hideonMouseOut=true;
	fw_menu_sim.bgColor='#DFDFDF';
	fw_menu_sim.menuBorder=1;
	fw_menu_sim.menuLiteBgColor='#FFFFFF';
	fw_menu_sim.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_prepaid) return;
		window.fw_menu_prepaid = new Menu("Qu&#7843;n lý Thuê bao tr&#7843; tr&#432;&#7899;c",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_prepaid.addMenuItem("H&#432;&#7899;ng d&#7851;n &#273;&#259;ng ký","location='/web/vn/everything/prepaid_guider.jsp'");	
	fw_menu_prepaid.addMenuItem("Câu h&#7887;i th&#432;&#7901;ng g&#7863;p","location='/web/vn/everything/prepaid_faq.jsp'");	
	fw_menu_prepaid.addMenuItem("Bi&#7875;u m&#7851;u &#273;&#259;ng ký","location='/web/vn/prepaid/'");	
	fw_menu_prepaid.hideonMouseOut=true;
	fw_menu_prepaid.bgColor='#DFDFDF';
	fw_menu_prepaid.menuBorder=1;
	fw_menu_prepaid.menuLiteBgColor='#FFFFFF';
	fw_menu_prepaid.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_custpolicies) return;
		window.fw_menu_custpolicies = new Menu("root",170,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_custpolicies.addMenuItem(fw_menu_prepaid,"location='/web/vn/everything/prepaid_guider.jsp'");
	fw_menu_custpolicies.addMenuItem("&#272;&#259;ng ký HomeZone","location='/web/vn/homezone/'");		
	fw_menu_custpolicies.hideonMouseOut=true;
	fw_menu_custpolicies.bgColor='#DFDFDF';
	fw_menu_custpolicies.menuBorder=1;
	fw_menu_custpolicies.menuLiteBgColor='#FFFFFF';
	fw_menu_custpolicies.menuBorderBgColor='#C5C5C5';
	

	if (window.fw_menu_mobifone) return;
		window.fw_menu_mobifone = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_mobifone.addMenuItem("L&#7883;ch s&#7917; phát tri&#7875;n","location='/web/vn/home/mobifone_history.jsp'");	
	fw_menu_mobifone.addMenuItem("S&#417; &#273;&#7891; t&#7893; ch&#7913;c","location='/web/vn/home/mobifone_structure.jsp'");
	fw_menu_mobifone.addMenuItem("Cam k&#7871;t v&#7899;i khách hàng","location='/web/vn/home/mobifone_customer.jsp'");
	fw_menu_mobifone.addMenuItem("Tiêu chu&#7849;n ch&#7845;t l&#432;&#7907;ng","location='/web/vn/everything/ctdkcl.jsp'");
	fw_menu_mobifone.addMenuItem("Logo MobiFone","location='/web/vn/everything/Logo.jsp'");
	fw_menu_mobifone.hideonMouseOut=true;
	fw_menu_mobifone.bgColor='#DFDFDF';
	fw_menu_mobifone.menuBorder=1;
	fw_menu_mobifone.menuLiteBgColor='#FFFFFF';
	fw_menu_mobifone.menuBorderBgColor='#C5C5C5';

	if (window.fw_menu_othertariff) return;
		window.fw_menu_othertariff = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	fw_menu_othertariff.addMenuItem("C&#x1B0;&#x1EDB;c IDD","location='/web/vn/products/tariff_idd.jsp'");
	fw_menu_othertariff.addMenuItem("C&#x1B0;&#x1EDB;c 171","location='/web/vn/products/tariff_171.jsp'");
	fw_menu_othertariff.addMenuItem("C&#x1B0;&#x1EDB;c 1717","location='/web/vn/products/tariff_1717.jsp'");
	fw_menu_othertariff.addMenuItem("C&#x1B0;&#x1EDB;c d&#x1ECB;ch v&#x1EE5; ti&#x1EC7;n ích","location='/web/vn/products/tariff_vas.jsp'");
	fw_menu_othertariff.addMenuItem("C&#x1B0;&#x1EDB;c t&#x1EEB; internet","location='/web/vn/products/tariff_web.jsp'");
	fw_menu_othertariff.hideonMouseOut=true;
	fw_menu_othertariff.bgColor='#DFDFDF';
	fw_menu_othertariff.menuBorder=1;
	fw_menu_othertariff.menuLiteBgColor='#FFFFFF';
	fw_menu_othertariff.menuBorderBgColor='#C5C5C5';
	//Bat dau menu xo doc
	if (window.mm_menu_product_0_1) return;
		window.mm_menu_product_0_1 = new Menu("B&#7843;ng giá c&#432;&#7899;c",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_product_0_1.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiGold","location='/web/vn/products/tariff_g.jsp'");
	mm_menu_product_0_1.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiCard","location='/web/vn/products/tariff_c.jsp'");
	mm_menu_product_0_1.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiPlay","location='/web/vn/products/tariff_play.jsp'");
	mm_menu_product_0_1.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c Mobi4U","location='/web/vn/products/tariff_u.jsp'");
	mm_menu_product_0_1.addMenuItem("B&#x1EA3;ng c&#x1B0;&#x1EDB;c MobiQ","location='/web/vn/products/tariff_q.jsp'");
	mm_menu_product_0_1.hideOnMouseOut=true;
	mm_menu_product_0_1.bgColor='#DFDFDF';
	mm_menu_product_0_1.menuBorder=1;
	mm_menu_product_0_1.menuLiteBgColor='#FFFFFF';
	mm_menu_product_0_1.menuBorderBgColor='#C5C5C5';	

	if (window.mm_menu_product_0) return;
		window.mm_menu_product_0 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_product_0.addMenuItem("MobiGold","location='/web/vn/products/mobigold.jsp'");
	mm_menu_product_0.addMenuItem("MobiCard","location='/web/vn/products/mobicard.jsp'");
	mm_menu_product_0.addMenuItem("Mobi4U","location='/web/vn/products/mobi4u.jsp'");
	mm_menu_product_0.addMenuItem("MobiPlay","location='/web/vn/products/mobiplay.jsp'");
	mm_menu_product_0.addMenuItem("MobiQ","location='/web/vn/products/mobiq.jsp'");
	mm_menu_product_0.addMenuItem(mm_menu_product_0_1,"location='#'");
	mm_menu_product_0.hideOnMouseOut=true;
	mm_menu_product_0.bgColor='#DFDFDF';
	mm_menu_product_0.menuBorder=1;
	mm_menu_product_0.menuLiteBgColor='#FFFFFF';
	mm_menu_product_0.menuBorderBgColor='#C5C5C5';	
	
	if (window.mm_menu_fun_0_1) return;
		window.mm_menu_fun_0_1 = new Menu("Bi&#7875;u t&#432;&#7907;ng",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_fun_0_1.addMenuItem("Logo &#273;en tr&#7855;ng","location='/web/vn/mobifunlive/logo.jsp'");
	mm_menu_fun_0_1.addMenuItem("Logo m&#7847;u","location='/web/vn/mobifunlive/colorlogo.jsp'");
	mm_menu_fun_0_1.addMenuItem("Picture message","location='/web/vn/mobifunlive/picturemessage.jsp'");	
	mm_menu_fun_0_1.hideOnMouseOut=true;
	mm_menu_fun_0_1.bgColor='#DFDFDF';
	mm_menu_fun_0_1.menuBorder=1;
	mm_menu_fun_0_1.menuLiteBgColor='#FFFFFF';
	mm_menu_fun_0_1.menuBorderBgColor='#C5C5C5';	


	if (window.mm_menu_fun_0) return;
		window.mm_menu_fun_0 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_fun_0.addMenuItem("FunRing","location='http://www.mobifone.com.vn/crbtuser_v/'");
	mm_menu_fun_0.addMenuItem("Nh&#7841;c chuông &#273;a âm","location='/web/vn/mobifunlive/polyphonic.jsp'");
	mm_menu_fun_0.addMenuItem("Nh&#7841;c chuông &#273;&#417;n âm","location='/web/vn/mobifunlive/ringtone.jsp'");
	mm_menu_fun_0.addMenuItem("Màn hình n&#7873;n","location='/web/vn/mobifunlive/wallpaper.jsp'");
	mm_menu_fun_0.addMenuItem("Màn hình &#273;&#7897;ng","location='/web/vn/mobifunlive/screensaver.jsp'");
	mm_menu_fun_0.addMenuItem(mm_menu_fun_0_1,"location='#'");
	//mm_menu_fun_0.addMenuItem("Trò ch&#417;i","location='/web/vn/mobifunlive/game.jsp'");
	mm_menu_fun_0.hideOnMouseOut=true;
	mm_menu_fun_0.bgColor='#DFDFDF';
	mm_menu_fun_0.menuBorder=1;
	mm_menu_fun_0.menuLiteBgColor='#FFFFFF';
	mm_menu_fun_0.menuBorderBgColor='#C5C5C5';	

	if (window.mm_menu_service_0_1) return;
		window.mm_menu_service_0_1 = new Menu("G&#7917;i tin nh&#7855;n",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_1.addMenuItem("Tin nh&#7855;n vui","location='/web/vn/sms/smsFun.jsp'");
	mm_menu_service_0_1.addMenuItem("B&#7843;n tin m&#7851;u","location='/web/vn/sms/smsTpl.jsp'");
	mm_menu_service_0_1.addMenuItem("G&#7917;i tin nh&#7855;n t&#7899;i Email","location='/web/vn/sms/sms2email.jsp'");
	mm_menu_service_0_1.addMenuItem("T&#7915; &#273;i&#7875;n tin nh&#7855;n","location='/web/vn/sms/smsDictionary.jsp'");
	mm_menu_service_0_1.addMenuItem("Cài &#273;&#7863;t d&#7883;ch v&#7909; SMS","location='/web/vn/sms/smsSetup.jsp'");
	mm_menu_service_0_1.addMenuItem("Spam SMS","location='/web/vn/sms/smsSpam.jsp'");
	mm_menu_service_0_1.addMenuItem("G&#7917;i tin nh&#7855;n t&#7899;i danh sách","location='/web/vn/sms/CSVsms.jsp'");
	mm_menu_service_0_1.hideOnMouseOut=true;
	mm_menu_service_0_1.bgColor='#DFDFDF';
	mm_menu_service_0_1.menuBorder=1;
	mm_menu_service_0_1.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_1.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0_2) return;
		window.mm_menu_service_0_2 = new Menu("S&#7893; &#273;&#7883;a ch&#7881;",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_2.addMenuItem("Nhóm s&#7893; &#273;&#7883;a ch&#7881;","location='/web/vn/addressbook/group.jsp'");
	mm_menu_service_0_2.addMenuItem("Download s&#7893; &#273;&#7883;a ch&#7881;","location='/web/vn/addressbook/downloadAddress.jsp'");
	mm_menu_service_0_2.addMenuItem("Upload s&#7893; &#273;&#7883;a ch&#7881;","location='/web/vn/addressbook/uploadAddress.jsp'");
	mm_menu_service_0_2.addMenuItem("Truy c&#7853;p b&#7857;ng WAP","location='/web/vn/addressbook/wap_doc.jsp'");
	mm_menu_service_0_2.hideOnMouseOut=true;
	mm_menu_service_0_2.bgColor='#DFDFDF';
	mm_menu_service_0_2.menuBorder=1;
	mm_menu_service_0_2.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_2.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0_3) return;
		window.mm_menu_service_0_3 = new Menu("L&#7883;ch làm vi&#7879;c",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_3.addMenuItem("T&#7915;ng ngày","location='/web/vn/calendar/calendar.jsp'");
	mm_menu_service_0_3.addMenuItem("Hàng ngày","location='/web/vn/calendar/calendar_daily.jsp'");
	mm_menu_service_0_3.addMenuItem("Hàng tu&#7847;n","location='/web/vn/calendar/calendar_weekly.jsp'");
	mm_menu_service_0_3.addMenuItem("Hàng tháng","location='/web/vn/calendar/calendar_monthly.jsp'");
	mm_menu_service_0_3.addMenuItem("Hàng n&#259;m","location='/web/vn/calendar/calendar_annually.jsp'");
	mm_menu_service_0_3.addMenuItem("Truy c&#7853;p b&#7857;ng WAP","location='/web/vn/calendar/wap_doc.jsp'");
	mm_menu_service_0_3.hideOnMouseOut=true;
	mm_menu_service_0_3.bgColor='#DFDFDF';
	mm_menu_service_0_3.menuBorder=1;
	mm_menu_service_0_3.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_3.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0_4) return;
		window.mm_menu_service_0_4 = new Menu("Th&#432; vi&#7879;n &#7843;nh cá nhân",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_4.addMenuItem("T&#7841;o album","location='/web/vn/pictureGallery/indexCreateAlbum.jsp'");
	mm_menu_service_0_4.addMenuItem("Thêm &#7843;nh","location='/web/vn/pictureGallery/indexUpload.jsp'");
	mm_menu_service_0_4.addMenuItem("Thùng rác","location='/web/vn/pictureGallery/indexBin.jsp'");
	mm_menu_service_0_4.hideOnMouseOut=true;
	mm_menu_service_0_4.bgColor='#DFDFDF';
	mm_menu_service_0_4.menuBorder=1;
	mm_menu_service_0_4.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_4.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0_5) return;
		window.mm_menu_service_0_5 = new Menu("Cài &#273;&#7863;t t&#7921; &#273;&#7897;ng",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_5.addMenuItem("&#272;&#259;ng ký s&#7917; d&#7909;ng GPRS","location='/web/vn/ota/indexGPRS.jsp'");	
	mm_menu_service_0_5.addMenuItem("Cài &#273;&#7863;t WAP","location='/web/vn/ota/indexProducerWap.jsp'");		
	mm_menu_service_0_5.addMenuItem("Cài &#273;&#7863;t MMS","location='/web/vn/ota/indexProducerMMS.jsp'");
	mm_menu_service_0_5.addMenuItem("Cài &#273;&#7863;t Email","location='/web/vn/ota/indexModelEmail.jsp'");	
	mm_menu_service_0_5.addMenuItem("H&#7895; tr&#7907;","location='/web/vn/ota/indexSupport.jsp'");
	mm_menu_service_0_5.hideonMouseOut=true;
	mm_menu_service_0_5.bgColor='#DFDFDF';
	mm_menu_service_0_5.menuBorder=1;
	mm_menu_service_0_5.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_5.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0_6) return;
		window.mm_menu_service_0_6 = new Menu("Các d&#7883;ch v&#7909; khác",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_6.addMenuItem("LiveScore","location='/web/vn/livescore/'");
	mm_menu_service_0_6.addMenuItem("USSD","location='/web/vn/services/#'");
	mm_menu_service_0_6.addMenuItem("H&#7897;p th&#432; tho&#7841;i","location='/web/vn/services/#'");
	mm_menu_service_0_6.addMenuItem("Thông tin b&#7857;ng tin nh&#7855;n","location='/web/vn/services/#'");	
	mm_menu_service_0_6.addMenuItem("8xxx","location='/web/vn/services/8xxx.jsp'");
	mm_menu_service_0_6.hideonMouseOut=true;
	mm_menu_service_0_6.bgColor='#DFDFDF';
	mm_menu_service_0_6.menuBorder=1;
	mm_menu_service_0_6.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_6.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0_7) return;
		window.mm_menu_service_0_7 = new Menu("Các d&#7883;ch v&#7909; ph&#7909;",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0_7.addMenuItem("C&#x1B0;&#x1EDB;c IDD","location='/web/vn/products/tariff_idd.jsp'");
	mm_menu_service_0_7.addMenuItem("C&#x1B0;&#x1EDB;c 171","location='/web/vn/products/tariff_171.jsp'");
	mm_menu_service_0_7.addMenuItem("C&#x1B0;&#x1EDB;c 1717","location='/web/vn/products/tariff_1717.jsp'");
	mm_menu_service_0_7.addMenuItem("C&#x1B0;&#x1EDB;c d&#x1ECB;ch v&#x1EE5; ti&#x1EC7;n ích","location='/web/vn/products/tariff_vas.jsp'");
	mm_menu_service_0_7.addMenuItem("C&#x1B0;&#x1EDB;c t&#x1EEB; internet","location='/web/vn/products/tariff_web.jsp'");
	mm_menu_service_0_7.hideonMouseOut=true;
	mm_menu_service_0_7.bgColor='#DFDFDF';
	mm_menu_service_0_7.menuBorder=1;
	mm_menu_service_0_7.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0_7.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_service_0) return;
		window.mm_menu_service_0 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_service_0.addMenuItem(mm_menu_service_0_1,"location='/web/vn/sms/'");
	mm_menu_service_0.addMenuItem("Th&#432; &#273;i&#7879;n t&#7917;","location='/web/vn/email/'");
	mm_menu_service_0.addMenuItem(mm_menu_service_0_2,"location='/web/vn/addressbook/'");
	mm_menu_service_0.addMenuItem(mm_menu_service_0_3,"location='/web/vn/calendar/'");
	mm_menu_service_0.addMenuItem(mm_menu_service_0_4,"location='/web/vn/pictureGallery/'");
	mm_menu_service_0.addMenuItem(mm_menu_service_0_5,"location='/web/vn/ota/'");
	mm_menu_service_0.addMenuItem("Báo cu&#7897;c g&#7885;i nh&#7905;","location='/web/vn/mca/'");
	mm_menu_service_0.addMenuItem("MobiChat","location='/web/vn/chat/'");
	mm_menu_service_0.addMenuItem("MobiFone Info","location='/web/vn/services/mobiinfo.jsp'");
	mm_menu_service_0.addMenuItem(mm_menu_service_0_6,"location='/web/vn/services/'");
	mm_menu_service_0.addMenuItem(mm_menu_service_0_7,"location='/web/vn/services/'");
	mm_menu_service_0.hideOnMouseOut=true;
	mm_menu_service_0.bgColor='#DFDFDF';
	mm_menu_service_0.menuBorder=1;
	mm_menu_service_0.menuLiteBgColor='#FFFFFF';
	mm_menu_service_0.menuBorderBgColor='#C5C5C5';
	
	if (window.mm_menu_home_0_1) return;
		window.mm_menu_home_0_1 = new Menu("Tin t&#7913;c",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_1.addMenuItem("Tin t&#7913;c và S&#7921; ki&#7879;n","location='/web/vn/home/news.jsp'");
	mm_menu_home_0_1.addMenuItem("Khuy&#7871;n m&#7841;i","location='/web/vn/home/promotion.jsp'");	
	mm_menu_home_0_1.hideonMouseOut=true;
	mm_menu_home_0_1.bgColor='#DFDFDF';
	mm_menu_home_0_1.menuBorder=1;
	mm_menu_home_0_1.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_1.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_2) return;
		window.mm_menu_home_0_2 = new Menu("Gi&#7899;i thi&#7879;u MobiFone",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_2.addMenuItem("L&#7883;ch s&#7917; phát tri&#7875;n","location='/web/vn/home/mobifone_history.jsp'");	
	mm_menu_home_0_2.addMenuItem("S&#417; &#273;&#7891; t&#7893; ch&#7913;c","location='/web/vn/home/mobifone_structure.jsp'");
	mm_menu_home_0_2.addMenuItem("Cam k&#7871;t v&#7899;i khách hàng","location='/web/vn/home/mobifone_customer.jsp'");
	mm_menu_home_0_2.addMenuItem("Tiêu chu&#7849;n ch&#7845;t l&#432;&#7907;ng","location='/web/vn/everything/ctdkcl.jsp'");
	mm_menu_home_0_2.addMenuItem("Logo MobiFone","location='/web/vn/everything/Logo.jsp'");
	mm_menu_home_0_2.hideonMouseOut=true;
	mm_menu_home_0_2.bgColor='#DFDFDF';
	mm_menu_home_0_2.menuBorder=1;
	mm_menu_home_0_2.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_2.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_3) return;
		window.mm_menu_home_0_3 = new Menu("H&#7879; th&#7889;ng phân ph&#7889;i",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_3.addMenuItem("64 t&#7881;nh thành","location='/web/vn/home/distribute_system.jsp'");
	mm_menu_home_0_3.addMenuItem("&#272;&#7841;i lý login","location='/web/vn/home/#'");	
	mm_menu_home_0_3.hideonMouseOut=true;
	mm_menu_home_0_3.bgColor='#DFDFDF';
	mm_menu_home_0_3.menuBorder=1;
	mm_menu_home_0_3.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_3.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_4) return;
		window.mm_menu_home_0_4 = new Menu("Vùng ph&#7911; sóng",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_4.addMenuItem("GSM","location='/web/vn/home/coverage.jsp?centerId=101'");
	mm_menu_home_0_4.addMenuItem("GPRS/MMS","location='/web/vn/home/coverage_gprs.jsp'");	
	mm_menu_home_0_4.hideOnMouseOut=true;
	mm_menu_home_0_4.bgColor='#DFDFDF';
	mm_menu_home_0_4.menuBorder=1;
	mm_menu_home_0_4.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_4.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_5) return;
		window.mm_menu_home_0_5 = new Menu("Chuy&#7875;n vùng qu&#7889;c t&#7871;",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_5.addMenuItem("Gi&#7899;i thi&#7879;u","location='/web/vn/everything/vn_roaming.jsp'");
	mm_menu_home_0_5.addMenuItem("H&#432;&#7899;ng d&#7851;n","location='/web/vn/everything/vn_roaming_user_guide.jsp'");	
	mm_menu_home_0_5.addMenuItem("Danh sách các m&#7841;ng","location='/web/vn/everything/partners.jsp'");
	mm_menu_home_0_5.hideonMouseOut=true;
	mm_menu_home_0_5.bgColor='#DFDFDF';
	mm_menu_home_0_5.menuBorder=1;
	mm_menu_home_0_5.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_5.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_6) return;
		window.mm_menu_home_0_6 = new Menu("Hình th&#7913;c n&#7841;p ti&#7873;n",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_6.addMenuItem("Th&#7867; gi&#7845;y","location='/web/vn/home/thanhtoan_atm.jsp'");
	mm_menu_home_0_6.addMenuItem("MobiEZ","location='/web/vn/mobiEz/'");	
	mm_menu_home_0_6.addMenuItem("Mã th&#7867;","location='/web/vn/home/thanhtoan_atm.jsp'");
	mm_menu_home_0_6.hideonMouseOut=true;
	mm_menu_home_0_6.bgColor='#DFDFDF';
	mm_menu_home_0_6.menuBorder=1;
	mm_menu_home_0_6.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_6.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_7) return;
		window.mm_menu_home_0_7 = new Menu("SIM",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_7.addMenuItem("SuperSIM","location='/web/vn/everything/supersim.jsp'");
	mm_menu_home_0_7.addMenuItem("Sim 128K","location='/web/vn/everything/supersim128k.jsp'");	
	mm_menu_home_0_7.addMenuItem("Sim 32K","location='/web/vn/everything/sim32k.jsp'");
	mm_menu_home_0_7.hideonMouseOut=true;
	mm_menu_home_0_7.bgColor='#DFDFDF';
	mm_menu_home_0_7.menuBorder=1;
	mm_menu_home_0_7.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_7.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_8_1) return;
		window.mm_menu_home_0_8_1 = new Menu("Qu&#7843;n lý Thuê bao tr&#7843; tr&#432;&#7899;c",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_8_1.addMenuItem("H&#432;&#7899;ng d&#7851;n &#273;&#259;ng ký","location='/web/vn/everything/prepaid_guider.jsp'");
	mm_menu_home_0_8_1.addMenuItem("Câu h&#7887;i th&#432;&#7901;ng g&#7863;p","location='/web/vn/everything/prepaid_faq.jsp'");
	mm_menu_home_0_8_1.addMenuItem("Bi&#7875;u m&#7851;u &#273;&#259;ng ký","location='/web/vn/prepaid/'");
	mm_menu_home_0_8_1.hideonMouseOut=true;
	mm_menu_home_0_8_1.bgColor='#DFDFDF';
	mm_menu_home_0_8_1.menuBorder=1;
	mm_menu_home_0_8_1.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_8_1.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0_8) return;
		window.mm_menu_home_0_8 = new Menu("Chính sách khách hàng",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0_8.addMenuItem(mm_menu_home_0_8_1,"location='/web/vn/everything/prepaid_guider.jsp'");
	mm_menu_home_0_8.addMenuItem("&#272;&#259;ng ký HomeZone","location='/web/vn/homezone/'");	
	mm_menu_home_0_8.hideonMouseOut=true;
	mm_menu_home_0_8.bgColor='#DFDFDF';
	mm_menu_home_0_8.menuBorder=1;
	mm_menu_home_0_8.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0_8.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_home_0) return;
		window.mm_menu_home_0 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_home_0.addMenuItem(mm_menu_home_0_1,"location='/web/vn/home/news.jsp'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_2,"location='/web/vn/home/mobifone_history.jsp'");
	mm_menu_home_0.addMenuItem("H&#7895; tr&#7907; khách hàng","location='/web/vn/home/support_center.jsp'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_3,"location='/web/vn/home/distribute_system.jsp'");
	//mm_menu_home_0.addMenuItem("Chính sách khách hàng","location='/web/vn/home/vn_policies.jsp'");
	mm_menu_home_0.addMenuItem("&#272;&#432;&#7901;ng dây nóng","location='/web/vn/home/vn_hotline.jsp'");
	//mm_menu_home_0.addMenuItem("D&#7883;ch v&#7909; khách hàng","location='/web/vn/home/vn_service.jsp'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_4,"location='/web/vn/home/coverage.jsp'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_5,"location='/web/vn/everything/partners.jsp'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_6,"location='/web/vn/home/'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_7,"location='/web/vn/home/'");
	mm_menu_home_0.addMenuItem(mm_menu_home_0_8,"location='/web/vn/home/'");
	//mm_menu_home_0.addMenuItem("Qu&#7843;n lý Thuê bao tr&#7843; tr&#432;&#7899;c","location='/web/vn/everything/prepaid_guider.jsp'");
	//mm_menu_home_0.addMenuItem("&#272;&#259;ng ký HomeZone","location='/web/vn/homezone/'");
	//mm_menu_home_0.addMenuItem("Menu sim &#273;&#7897;ng","location='/web/vn/dstk/'");
	mm_menu_home_0.hideOnMouseOut=true;
	mm_menu_home_0.bgColor='#DFDFDF';
	mm_menu_home_0.menuBorder=1;
	mm_menu_home_0.menuLiteBgColor='#FFFFFF';
	mm_menu_home_0.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_vas_0_1) return;
		window.mm_menu_vas_0_1 = new Menu("Thông tin thuê bao",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_vas_0_1.addMenuItem("Tra c&#7913;u thông tin thuê bao","location='/web/vn/selfcare/checkProfile.jsp'");
	mm_menu_vas_0_1.addMenuItem("Các d&#7883;ch v&#7909; ti&#7879;n ích","location='/web/vn/selfcare/service.jsp'");
	mm_menu_vas_0_1.addMenuItem("Thông báo c&#432;&#7899;c","location='/web/vn/selfcare/checkBill.jsp'");	
	mm_menu_vas_0_1.addMenuItem("Xem chi ti&#7871;t c&#432;&#7899;c","location='/web/vn/selfcare/checkBillDetails.jsp'");
	mm_menu_vas_0_1.addMenuItem("Thông tin c&#432;&#7899;c phát sinh","location='/web/vn/selfcare/checkCreatedBill.jsp'");
	mm_menu_vas_0_1.addMenuItem("L&#7883;ch s&#7917; thuê bao","location='/web/vn/selfcare/checkHistory.jsp'");
	mm_menu_vas_0_1.hideonMouseOut=true;
	mm_menu_vas_0_1.bgColor='#DFDFDF';
	mm_menu_vas_0_1.menuBorder=1;
	mm_menu_vas_0_1.menuLiteBgColor='#FFFFFF';
	mm_menu_vas_0_1.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_vas_0_2) return;
		window.mm_menu_vas_0_2 = new Menu("K&#7871;t n&#7889;i dài lâu",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_vas_0_2.addMenuItem("Gi&#7899;i thi&#7879;u v&#7873; ch&#432;&#417;ng trình","location='/web/vn/loyalty/about.jsp'");
	mm_menu_vas_0_2.addMenuItem("Tra c&#7913;u &#273;i&#7875;m s&#7889;","location='/web/vn/loyalty/displaymark.jsp'");
	mm_menu_vas_0_2.addMenuItem("Tra c&#7913;u chi ti&#7871;t &#273;i&#7875;m","location='/web/vn/loyalty/markdetail.jsp'");
	mm_menu_vas_0_2.addMenuItem("Tra c&#7913;u l&#7883;ch s&#7917; x&#7871;p h&#7841;ng","location='/web/vn/loyalty/rankhistory.jsp'");
	mm_menu_vas_0_2.addMenuItem("Tra c&#7913;u quá trình trao gi&#7843;i","location='/web/vn/loyalty/rwdhistory.jsp'");	
	mm_menu_vas_0_2.hideOnMouseOut=true;
	mm_menu_vas_0_2.bgColor='#DFDFDF';
	mm_menu_vas_0_2.menuBorder=1;
	mm_menu_vas_0_2.menuLiteBgColor='#FFFFFF';
	mm_menu_vas_0_2.menuBorderBgColor='#C5C5C5';

	if (window.mm_menu_vas_0) return;
		window.mm_menu_vas_0 = new Menu("root",150,21,"Arial, Helvetica, sans-serif",11,"#3B3B3B","#FFFFFF","#F0F0F0","#4788E6","left","middle",3,0,400,-5,7,true,true,true,0,true,false);
	mm_menu_vas_0.addMenuItem("Tài kho&#7843;n MobiPortal","location='/web/vn/profiles/indexViewProfile.jsp'");
	mm_menu_vas_0.addMenuItem(mm_menu_vas_0_1,"location='/web/vn/selfcare/'");
	mm_menu_vas_0.addMenuItem(mm_menu_vas_0_2,"location='/web/vn/loyalty/'");	
	mm_menu_vas_0.hideOnMouseOut=true;
	mm_menu_vas_0.bgColor='#DFDFDF';
	mm_menu_vas_0.menuBorder=1;
	mm_menu_vas_0.menuLiteBgColor='#FFFFFF';
	mm_menu_vas_0.menuBorderBgColor='#C5C5C5';
	
	mm_menu_vas_0.writeMenus();
} 






