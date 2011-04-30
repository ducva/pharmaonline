<?php
//qtmgroup Database
// Tiếng việt
class clsTable extends DB_DBASES 
{
	var $sTableName;
	var $sAllField;
	var $iInsertId;
	function clsTable($sName)
	{
		$this->sTableName = $sName;
		$this->sAllField = $this->getfield($sName);
		$this->DB_DBASES();
	}
	function select($sFieldName = '', $sJoin = '', $sOn = '', $sCondition = '', $sOrder = '', $sLimit = '')
	{
		$sFieldName = ($sFieldName == '' ? '*' : $sFieldName);
		if($sJoin == '')
			$sField = str_replace('*', $this->sAllField, $sFieldName);
		else
		{
			$sSubField = $this->sAllField.", ".$this->getfield($sJoin);
			$sField = str_replace('*', $sSubField, $sFieldName);
		}
		$sField = preg_replace('/\([^\)]*\)/', '', $sField);
		$aField = explode(',', $sField);	
		$sCondition = ($sCondition == '' ? '' : "WHERE $sCondition");
		$sOrder = ($sOrder == '' ? '' : "ORDER BY $sOrder");
		$sLimit = ($sLimit == '' ? '' : "LIMIT $sLimit");
		$sJoin = ($sJoin == '' ? '' : " F INNER JOIN $sJoin L");
		$sOn = ($sOn == '' ? '' : "ON $sOn");
		$sql = "SELECT $sFieldName FROM $this->sTableName $sJoin $sOn $sCondition $sOrder $sLimit";
		//echo $sql;die;
		$result = $this->db_query($sql);

		$aTable = array();
		$iLine = -1;
		while($row = $this->db_fetch_array($result))
		{
			$iLine++;
			reset($aField);
			while(list($key, $value) = each($aField))
			{
				$value = ((strpos($value, ' as ')) ? substr($value, strpos( $value, ' as ') + 4) : $value);
				
				$value = trim($value);
				
				$aTable[$iLine][$value] = $row[$value];
			}
		}
		var_dump($aTable); die;
		return $aTable;
	}
	function insert($sFields, $sValues)
	{
		$FirstBlank=$this->firstblank();
		//echo $FirstBlank;
		$sql = "INSERT INTO $this->sTableName (Id, $sFields) VALUES('".$FirstBlank."', $sValues)";
		$this->insert_id($FirstBlank);
		$result = $this->db_query($sql);
	}
	function update($sValues, $sCondition = '')
	{
		$sCondition = ($sCondition == '' ? '' : "WHERE $sCondition");
		$sql = "UPDATE $this->sTableName SET $sValues $sCondition";
		$result = $this->db_query($sql);
	}
	function delete($sCondition)
	{
		$sql = "DELETE FROM $this->sTableName WHERE $sCondition";
		$result = $this->db_query($sql);
	}
	function insert_id($Id)
	{
		$this->iInsertId=$Id;
	}
	function get_insert_id()
	{
		return $this->iInsertId;
	}
	function firstblank()
	{
		$aTable = $this->select('Id','','','', 'Id asc');
		for($i = 1;;$i++)
		{
			if(isset($aTable[$i - 1]['Id']) && $aTable[$i-1]['Id'] != $i)
				return $i;
			elseif(!isset($aTable[$i - 1]['Id']))
				return $i; 	
		}
	}
	function getfield($sName)
	{
		switch ($sName)
		{
			case 'admin':
				$sField = 'Id, Username, Password, Status, LastLogin';
				break;
			case 'category':
				$sField = 'Id, Name, Position, Status, ListPropertyId, RootId, HotCategory';
				break;
			case 'currency':
				$sField = 'Id, Name, Info, Position, Status, Rate';
				break;
			case 'manufacturer':
				$sField = 'Id, Name, Telephone, Mobile, Fax, Email, Website, Address, Image, Info, Position, Status';
				break;
			case 'member':
				$sField = 'Id, Username, Password, Fullname, BirthDate, JoinDate, Email, Telephone,   Mobile, Address, Status, RootId';
				break;
			case 'news':
				$sField= 'Id, Title, Description, Detail, Image, ImageNote, newscategoryId, HotNews, Status, WriteDate, ModifyDate, View';
				break;
			case 'newscategory':
				$sField = 'Id, Name, Position, Status, RootId';
				break;
			case 'percent':
				$sField = 'Id, Point, Percent, Loop';
				break;
			case 'product':
				$sField = 'Id, Name, Code, Description, Detail, Image, ImageNote, Status, Views, Orders, Price, PriceQTM, HotProduct, CreateDate, ModifyDate, categoryId, unitId, currencyId, providerId, manufacturerId';
				break;
			case 'productproperty':
				$sField = 'Id, productId, propertyId, Value';
				break;
			case 'property':
				$sField='Id, Name, Detail, Unit, Value, Position, Status, RootId';
				break;
			case 'provider':
				$sField = 'Id, Name, Telephone, Mobile, Fax, Email, Website, Address, Image, Info, Position, Status';
				break;
			case 'unit':
				$sField = 'Id, Name, Info, Position, Status';
				break;
			case 'websiteconfig':
				$sField = 'Id, YahooMessenger, Skype, HotLine, Fax, Telephone, Email';
				break;
			case 'intro':
				$sField = 'Id, Detail, PageName';
				break;
			case 'rules':
				$sField = 'Id, Name, Detail, WriteDate, Status, Position';
				break;
			case 'advertising':
				$sField = 'Id, Name, Position, Priority, Type, Status, Link, File';
				break;
			case 'usersonline':
				$sField = 'Id, TimeStamp, SessionID, File';
				break;
			case 'method':
				$sField = 'Id, Money, YahooMessenger, Skype, Email, HotLine, Fax, Telephone';
				break;
			case 'orders':
				$sField = 'Id, CreateDate, PayDate, Status, Money, memberId, Address';
				break;
			case 'ordersdetail':
				$sField = 'Id, Quantity, CreateDate, ordersId, productId';
				break;
			case 'rate':
				$sField = 'Id, Point, Percent';
				break;
		}
		return $sField;
	}
}

//Copyright by MrMinh
?>