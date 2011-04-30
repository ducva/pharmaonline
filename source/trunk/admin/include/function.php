<?php
	function thumbnail($src_url, $type, $src_name, $sUploadDir, $iWidth) 
	{
		$dst_path = $sUploadDir; 
		$dst_name = "$src_name";
		//$scale = 0.2;
		$quality = 100; # [0-100], 100 being max.
##########################################################################

		$dst_url = $dst_path.$dst_name;

		$src_size= getimagesize("$src_url");

		# calculate h and w for thumb:
		$dst_w=	$iWidth;//$src_size[0]*$scale;
		$dst_h= $src_size[1]/$src_size[0]*$dst_w;//$scale;
		$dst_img=imagecreatetruecolor($dst_w,$dst_h);

		switch($type)
		{
			case "image/jpeg":
			case "image/pjpeg":
			case "image/jpg":	$src_img=ImageCreateFromjpeg($src_url); 
								break;
			
			case "image/gif":	$src_img=imagecreatefromgif($src_url); 
								break;
			case "image/x-png":
			case "image/x-png": 	$src_img=imagecreatefrompng($src_url); 
									break;
			default:	echo "Ch? du?c upload file ?nh d?ng GIF, PNG, JPEG (JPG)! <input type=button value=\"L�m L?i\" onClick=\"javascript:history.go(-1);\">";
					exit();
		}
		imagecopyresampled($dst_img,$src_img,0,0,0,0,$dst_w,$dst_h,ImageSX($src_img),ImageSY($src_img));
		imagejpeg($dst_img,$dst_url,$quality); # output the in-memory file to disk
		imagedestroy($dst_img); # free memory. important if you create many images at once
	}

?>