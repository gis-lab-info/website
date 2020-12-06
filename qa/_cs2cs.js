/*
wwww.tigir.com - 17.05.2006
���������� linkedselect.js �� ������ "SELECT*n + Javascript = c�������� ������" - http://www.tigir.com/linked_select.htm

syncList - "�����" ��������� �������
*/
function syncList(){} //���������� ������� �����������

//���������� ������

//����� sync() - ��������� ������ �� �������� ��������� id ��������� SELECT, ���������� ��������� ������ � ��������� �� �������������
syncList.prototype.sync = function()
{
	//���������� ��������� (id ��������� SELECT) � ��������� �������� onChange ��������, � ���������������� id, �������-����������. 
	//� �������� ����������� ��������� ������ ����� ������� syncList - _sync (�������� ��� �������� �� �����) 
	//���������� ����������� ���� ��������� SELECT ����� ���������� � ������ ����������, �.�. ��������� �� ������ �� �� ����� ������ ������� SELECT � � ��� �� ����� ������������������.
	for (var i=0; i < arguments.length-1; i++)	document.getElementById(arguments[i]).onchange = (function (o,id1,id2){return function(){o._sync(id1,id2);};})(this, arguments[i], arguments[i+1]);
	document.getElementById(arguments[0]).onchange();//��������� ���������� onchange ������� �������, ����� ��� �������� �������� ��������� �������� ������� ����������.
}
//��������� ����� _sync - ����������� ��� ����� ���������� �������� � ������� (�������) �������� SELECT (�� ��� ������� onChange) � �������� ���������� ���������� ������� �� ��������� �������� ���������� � ������� �������.
syncList.prototype._sync = function (firstSelectId, secondSelectId)
{
	var firstSelect = document.getElementById(firstSelectId);
	var secondSelect = document.getElementById(secondSelectId);
	
	secondSelect.length = 0; //�������� ������ (�����������) SELECT
	
	if (firstSelect.length>0)//���� ������ (�������) SELECT �� ����
	{
		if (firstSelect.selectedIndex == -1) firstSelect.options[0].selected = true; //���� � ������� SELECT-� ��� ����������� ������, �������� ������

		//�� �������� dataList, � ������� ��� ���������� ����������� ��������, ����� �� ����� ������, ������� ������������� ������ �������� ��������, 
		//���������� � ������ �������, � ���������� ���������� ������������ �������� SELECT.
		var optionData = this.dataList[ firstSelect.options[firstSelect.selectedIndex].value ];
		//��������� ������ (�����������) ������ ���������� (������� �������� option)
		for (var key in optionData || null) secondSelect.options[secondSelect.length] = new Option(optionData[key], key);
		//���� �� ������ ������ ��� ����������� ������, �������� ������ ��� �����
		if (secondSelect.length>0) secondSelect.options[0].selected = true;
		
		//���� ������ (�����������) ������ ����� � ���� ������� ���� ����������� ������� (��, ��� ������� �� �������), 
		//�� ��������� ��� ���������� onchange, ����� �������� ��� ����������� �������
		secondSelect.onchange && secondSelect.onchange();
	}
};