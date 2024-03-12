<?php
/*
 This program is free software. You can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License.

 Home:   http://www.it2k.ru/projects/class-ipgeo/
 Author: Egor N. Zuskin

 Simple for php:
 $ipList = new IPGeo("xxx.xxx.xxx.xxx,xxx.xxx.xxx.xxx");
 print $ipList->ip("xxx.xxx.xxx.xxx"); // city: xxxx
 or
 $ipList = new IPGeo(array("xxx.xxx.xxx.xxx", "xxx.xxx.xxx.xxx"));
 print $ipList->ip("xxx.xxx.xxx.xxx","region"); // region: xxxx
 or
 $ipList = new IPGeo("xxx.xxx.xxx.xxx");
 print $ipList->ip("xxx.xxx.xxx.xxx", "district"); // district: xxxx
*/

DEFINE("IPGEO_SERVER", "194.85.91.253"); // сервер ip geo
DEFINE("IPGEO_SERVER_PORT", 8090);       // порт
DEFINE("IPGEO_DEFAULT_PARAM", "city");   // поле возвращаемое поумолчанию
DEFINE("IPGEO_DEBUG", false);            // признак отладки (не обращается к серверу)

/**
 * @author ice
 * Класс для получения ip адресов с сервиса ipgeobase.ru
 */
class IPGeo {
	var $xml        = "";           // текст возвращаемого xml
	var $ip_arr     = array();      // массив ip адресов
	var $fields_arr = array("all"); // список запрашиваемых полей
//	var $fields_arr = array("city");
	var $cache      = array();      // кешь ответа

	/**
	 * Создание класса и запрос к серверу
	 * @param $AIpList список ip адресов, строкой либо строкой через запятую либо массивом
	 * @return bool
	 */
	function IPGeo($AIpList)
	{        
		if (IPGEO_DEBUG)
		{
			return true;			
		}
		
		if (is_array($AIpList))
		{
			$ip_arr = $AIpList;
		}
		else
		{
			if (strpos($AIpList, ",") === False)
			{
				$ip_arr = array(trim($AIpList));
			}
			else
			{
				$ip_arr = explode(",",trim($AIpList));
			}
		}

		$ip_arr = array_unique($ip_arr);
		$ip_arr = $this->check_ip_list_valid($ip_arr);
		
		if (count($ip_arr) == 0)
			return false;

		$ips = "<ip>" . implode("</ip><ip>",$ip_arr) . "</ip>";
		$fields = "<" . implode("/><", $this->fields_arr)."/>";
		$post_string = "<ipquery><fields>".$fields."</fields><ip-list>".$ips."</ip-list></ipquery>";

		if (!$socket  = fsockopen(IPGEO_SERVER, IPGEO_SERVER_PORT))
			return false;

		$query  = "POST /geo/geo.html HTTP/1.1\r\n";
		$query .= "Content-Length: ".strlen ($post_string)."\r\n";
		$query .= "\r\n";
		$query .= $post_string;
		$query .= "\r\n\r\n";

		$response = "";
		fwrite($socket, $query);
		while (!feof($socket))
		{
			$response .= fgets($socket, 2048);
		}
		fclose($socket);
		$this->xml = trim(substr($response, strpos($response,"\r\n\r\n")));

		return true;
	}

	/**
	 * Возвращает запрошенное поле для ip адреса
	 * @param $AIp        IP адрес
	 * @param $AFiledName Поле
	 * @return string
	 */
	function ip($AIp, $AFiledName = IPGEO_DEFAULT_PARAM)
	{
        if (IPGEO_DEBUG)
        {
            return "not found";            
        }
        		if (isset($this->cache[$AIp][$AFiledName]))
		{			return $this->cache[$AIp][$AFiledName];
		}
		else
		{			if ($this->xml)
			{
				$doc = new DOMDocument;
				$doc->loadXML($this->xml);
				$xmlpath = new domxpath($doc);
				$ip_ansver = $doc->getElementsByTagName("ip-answer")->item(0);
				$items     = $xmlpath->query("ip", $ip_ansver);
				foreach ($items as $it)
				{					$ip = $it->getAttribute('value');					if ($ip == $AIp)
					{						$message = @$xmlpath->query("message", $it)->item(0)->nodeValue;
						$field_value = ($message<>"") ? strtolower($message) : iconv("UTF-8", "CP1251", $xmlpath->query($AFiledName, $it)->item(0)->nodeValue);
						$this->cache[$AIp][$AFiledName] = $field_value;
						return $field_value;
					}
				}
			}
        }
        return "not found";
	}

	/**
	 * Возвращает список правельных ip адресов проверенных по маске xxx.xxx.xxx.xxx < 256
	 * @param $AIpList масив ip адресов
	 * @return array
	 */
	function check_ip_list_valid($AIpList)
	{		$return = array();
		foreach($AIpList as $ip)
		{			if (ereg("([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3}).([0-9]{1,3})",$ip, $par))
			{
				if ($par[1] < 256 && $par[2] < 256 && $par[3] < 256 && $par[4] < 256)
				{					$return[] = $ip;
				}
			}
		}

		return $return;
	}

}

?>