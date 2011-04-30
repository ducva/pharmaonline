<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<?php
/**
*Người tạo: Nguyễn Mạnh Hồng
*Chức năng: Upload, đổi tên, resize ảnh
*Cách dùng: Ví dụ nếu như muốn up một ảnh sau khi đã Brower lên FileFildName có tên là file trong form upload
*lên một thư mục đích trên server ví dụ là images với tên 1_nho_15 kích thước ảnh rộng 100 cao 100
*làm như sau:
*if (isset($_POST['btnUpload']))
*	{
*		$oUpload = new clsUploadImage('file','../images/');
*		$oUpload->uploadfix('1_nho_','15',100,100);
*	}
*Nếu như muốn kíck thước của ảnh mới chỉ cố định chiều rộng còn chiều cao tỷ lệ theo ảnh cũ thì dùng
*$oUpload->uploadfix('1_nho_','15',100);
*/

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
		$dst_name = $pre_name.$src_name;
		$quality = 100; # [0-100], 100 being max.
		$dst_url = $this->dst_path.$dst_name;
		$src_size= getimagesize("$src_url");
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
			default:	echo "Chỉ được up ảnh  GIF, PNG, JPEG (JPG)! <input type=button value=\"Làm lại\" onClick=\"javascript:history.go(-1);\">";
					exit();
		}		
		imagecopyresampled($dst_img,$src_img,0,0,0,0,$dst_w,$dst_h,ImageSX($src_img),ImageSY($src_img));
		imagejpeg($dst_img,$dst_url,$quality); # output the in-memory file to disk
		imagedestroy($dst_img); # free memory. important if you create many images at once
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
			default:	echo "Chỉ được up ảnh  GIF, PNG, JPEG (JPG)! <input type=button value=\"Làm lại\" onClick=\"javascript:history.go(-1);\">";
					exit();
		}
		
		
		imagecopyresampled($dst_img,$src_img,0,0,0,0,$dst_w,$dst_h,ImageSX($src_img),ImageSY($src_img));
		imagejpeg($dst_img,$dst_url,$quality); # output the in-memory file to disk
		imagedestroy($dst_img); # free memory. important if you create many images at once
	}
	
	
	
	function uploadfix($pre_name,$ten_anh,$dst_w,$dst_h)
	{
		
		if(basename($_FILES[$this->filefield]['name'])!="")
		{
			
			$uploaddir = $this->dst_path.'tmp/';
			$leng=strlen(basename($_FILES[$this->filefield]['name']));
			$begin=$leng-3;
			$duoi_anh=substr(basename($_FILES[$this->filefield]['name']),$begin,3);
			$uploadfile=$uploaddir.$ten_anh.".".$duoi_anh;
			move_uploaded_file($_FILES[$this->filefield]['tmp_name'], $uploadfile);
			$this->type = $_FILES[$this->filefield]['type'];
			$this->extension = $duoi_anh;
			$this->resizefix($uploadfile,$pre_name,$dst_w,$dst_h);
			unlink($uploadfile);
		}
	}
	
	function uploadscale($pre_name,$ten_anh,$dst_w)
	{
		
		if(basename($_FILES[$this->filefield]['name'])!="")
		{
			
			$uploaddir = $this->dst_path.'tmp/';
			$leng=strlen(basename($_FILES[$this->filefield]['name']));
			$begin=$leng-3;
			$duoi_anh=substr(basename($_FILES[$this->filefield]['name']),$begin,3);
			$uploadfile=$uploaddir.$ten_anh.".".$duoi_anh;
			move_uploaded_file($_FILES[$this->filefield]['tmp_name'], $uploadfile);
			$this->type = $_FILES[$this->filefield]['type'];
			$this->extension = $duoi_anh;
			$this->resizescale($uploadfile,$pre_name,$dst_w,$dst_h);
			unlink($uploadfile);
		}
	}
}
?>