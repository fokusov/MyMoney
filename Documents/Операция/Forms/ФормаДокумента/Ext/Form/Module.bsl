﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если НЕ ЗначениеЗаполнено(Объект.Ссылка) Тогда
		Объект.Пользователь = ПараметрыСеанса.ТекущийПользователь;	
		
		Если ЭтаФорма.Параметры.ТипОперации <> "" Тогда
			Объект.ТипОперации = Перечисления.ТипыОпераций[ЭтаФорма.Параметры.ТипОперации];
		КонецЕсли; 
	КонецЕсли;
	
	УправлениеВидимостью();
	
КонецПроцедуры

&НаКлиенте
Процедура ТипОперацииПриИзменении(Элемент)
	
	УправлениеВидимостью();
	
КонецПроцедуры

Процедура УправлениеВидимостью()

	Элементы.ДанныеОперацииСчетПеремещения.Видимость = Ложь;
	Элементы.ДанныеОперацииСтатья.Видимость = Ложь;
	
	Если Объект.ТипОперации = Перечисления.ТипыОпераций.Приход Тогда
		
		Элементы.ДанныеОперацииКонтакт.Заголовок = "Плательщик";
		Элементы.ДанныеОперацииСтатья.Видимость = Истина;
		Элементы.ДанныеОперацииСтатья.Заголовок = "Статья дохода";
		
		Элементы.ДанныеОперацииСтатья.ОграничениеТипа = Новый ОписаниеТипов("СправочникСсылка.СтатьиДоходов");

	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.Расход Тогда
		
		Элементы.ДанныеОперацииКонтакт.Заголовок = "Получатель";
		Элементы.ДанныеОперацииСтатья.Видимость = Истина;
		Элементы.ДанныеОперацииСтатья.Заголовок = "Статья расхода";
		
		Элементы.ДанныеОперацииСтатья.ОграничениеТипа = Новый ОписаниеТипов("СправочникСсылка.СтатьиРасходов");
		
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.Перевод Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Ложь;
		Элементы.ДанныеОперацииСчетПеремещения.Видимость = Истина;
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.ОбменВалюты Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Ложь;
		Элементы.ДанныеОперацииСчетПеремещения.Видимость = Истина;
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.МыВзялиВДолг Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Истина;
		Элементы.ДанныеОперацииКонтакт.Заголовок = "У кого взяли";
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.МыВернулиДолг Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Истина;
		Элементы.ДанныеОперацииКонтакт.Заголовок = "Кому вернули";
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.МыДалиВДолг Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Истина;
		Элементы.ДанныеОперацииКонтакт.Заголовок = "Кому дали";
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.НамВернулиДолг Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Истина;
		Элементы.ДанныеОперацииКонтакт.Заголовок = "Кто вернул";
	ИначеЕсли Объект.ТипОперации = Перечисления.ТипыОпераций.ВводОстатка Тогда
		Элементы.ДанныеОперацииКонтакт.Видимость = Ложь;
	КонецЕсли; 	

КонецПроцедуры


