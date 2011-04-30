<?php 


class clsUploadImage
{
	
	var $dst_path;
	var $filefield;
	var $type;
	var $extension;
	function clsUploadImage($filefieldp,$dst_pathp)
	{
		$this->dst_path = $dst_pathp;
		$this->filefield = $filefieldp;
	}

	
					
	
	
	
	function resizefix($src_url,$pre_name,$dst_w,$dst_h) 
	{	
		$temp_url = explode("/",$src_url);
		$i=0;
		while ($i < sizeof($temp_url)) 
		{
			if ($temp_url[$i] != end($temp_url)) 
			{
				@$src_path .= $temp_url[$i]."/"; # src_path
			} 
			else 
			{
				$src_name = $temp_url[$i]; #src_name
			}
			$i++;
		}
		$dst_name = $pre_name."_nho_".$src_name;
		$quality = 100; # [0-100], 100 being max.
		$dst_url = $this->dst_path."thumbs/".$dst_name;
		$src_size= getimagesize("$src_url");
		if ($dst_w==400)
		{
			$dst_name = $pre_name."_to_".$src_name;
			$dst_h= $dst_w*$src_size[1]/$src_size[0];
			$dst_url = $this->dst_path.$dst_name;
		}
		//# calculate h and w for thumb:
		//$dst_w=	100;//$src_size[0]*$scale;
		//$dst_h= 100;//$scale;
		$dst_img=imagecreatetruecolor($dst_w,$dst_h);			
		switch($this->type)
		{
			case "image/jpeg":
			case "image/pjpeg":
			case "image/jpg":	$src_img=ImageCreateFromjpeg($src_url); 
								break;
			
			case "image/gif":	$src_img=imagecreatefromgif($src_url); 
								break;
			case "image/x-png":
			case "image/png": 	$src_img=imagecreatefrompng($src_url); 
									break;
			default:	echo "Ch? du?c up ?nh  GIF, PNG, JPEG (JPG)! <input type=button value=\"L�m l?i\" onClick=\"javascript:history.go(-1);\">";
					exit();
		}
		
		
		imagecopyresampled($dst_img,$src_img,0,0,0,0,$dst_w,$dst_h,ImageSX($src_img),ImageSY($src_img));
		imagejpeg($dst_img,$dst_url,$quality); # output the in-memory file to disk
		//imagedestroy($dst_img); # free memory. important if you create many images at once
	}
	
	
	function resizescale($src_url,$pre_name,$dst_w) 
	{	
		$temp_url = explode("/",$src_url);
		$i=0;
		while ($i < sizeof($temp_url)) 
		{
			if ($temp_url[$i] != end($temp_url)) 
			{
				@$src_path .= $temp_url[$i]."/"; # src_path
			} 
			else 
			{
				$src_name = $temp_url[$i]; #src_name
			}
			$i++;
		}
		$dst_name = $pre_name.$src_name;
		$quality = 100; # [0-100], 100 being max.
		$dst_url = $this->dst_path.$dst_name;
		$src_size= getimagesize("$src_url");
		# calculate h and w for thumb:
		//$dst_w=	100;//$src_size[0]*$scale;
		$dst_h= $dst_w*$src_size[1]/$src_size[0];//$scale;
		$dst_img=imagecreatetruecolor($dst_w,$dst_h);			
		switch($this->type)
		{
			case "image/jpeg":
			case "image/pjpeg":
			case "image/jpg":	$src_img=ImageCreateFromjpeg($src_url); 
								break;
			
			case "image/gif":	$src_img=imagecreatefromgif($src_url); 
								break;
			case "image/x-png":
			case "image/png": 	$src_img=imagecreatefrompng($src_url); 
									break;
			default:	echo "Ch? du?c up ?nh  GIF, PNG, JPEG (JPG)! <input type=button value=\"L�m l?i\" onClick=\"javascript:history.go(-1);\">";
					exit();
		}
		
		
		imagecopyresampled($dst_img,$src_img,0,0,0,0,$dst_w,$dst_h,ImageSX($src_img),ImageSY($src_img));
		imagejpeg($dst_img,$dst_url,$quality); # output the in-memory file to disk
		//imagedestroy($dst_img); # free memory. important if you create many images at once
	}
	
	
	
	function uploadfix($pre_name,$ten_anh)
	{
		//echo $this->dst_path;
		//echo $_FILES[$this->filefield]['name'];
		if(basename($_FILES[$this->filefield]['name'])!="")
		{
			//echo "da chay vao day";
			$uploaddir = $this->dst_path.'tmp/';
			$leng=strlen(basename($_FILES[$this->filefield]['name']));
			$begin=$leng-3;
			$duoi_anh=substr(basename($_FILES[$this->filefield]['name']),$begin,3);
			$uploadfile=$uploaddir.$ten_anh.".".$duoi_anh;
			//echo $uploadfile;
			move_uploaded_file($_FILES[$this->filefield]['tmp_name'], $uploadfile);
			$this->type = $_FILES[$this->filefield]['type'];
			$this->extension = $duoi_anh;
			//echo $pre_name.'fsdfsdf';
			//$this->resizefix($uploadfile,$pre_name,$dst_w,$dst_h);
			//$this->resizefix($uploadfile,$pre_name,$dst_w,$dst_h);
			$this->resizefix($uploadfile,$pre_name,100,100);
			$this->resizefix($uploadfile,$pre_name,400,400);
			unlink($uploadfile);
		}
	}
	
	function uploadscale($pre_name,$ten_anh,$dst_w)
	{
		echo $this->dst_path;
		echo $_FILES[$this->filefield]['name'];
		if(basename($_FILES[$this->filefield]['name'])!="")
		{
			//echo "da chay vao day";
			$uploaddir = $this->dst_path.'tmp/';
			$leng=strlen(basename($_FILES[$this->filefield]['name']));
			$begin=$leng-3;
			$duoi_anh=substr(basename($_FILES[$this->filefield]['name']),$begin,3);
			$uploadfile=$uploaddir.$ten_anh.".".$duoi_anh;
			move_uploaded_file($_FILES[$this->filefield]['tmp_name'], $uploadfile);
			$this->type = $_FILES[$this->filefield]['type'];
			//echo $pre_name.'fsdfsdf';
			$this->resizescale($uploadfile,$pre_name,$dst_w,$dst_h);
			unlink($uploadfile);
		}
	}
}
?>