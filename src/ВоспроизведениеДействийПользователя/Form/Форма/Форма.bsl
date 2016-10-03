﻿
&НаКлиенте
Процедура Команда1(Команда)
	ТестовыйСценарий_03_10_2016()
КонецПроцедуры


&НаКлиенте
Процедура ТестовыйСценарий_03_10_2016()

	ТестовоеПриложение = Новый ТестируемоеПриложение(,1539);
	ВремяОкончанияОжидания = ТекущаяДата() + 10;
	Подключен = Ложь;
	ОписаниеОшибкиСоединения = "";
	Пока Не ТекущаяДата() >= ВремяОкончанияОжидания Цикл
		Попытка
			ТестовоеПриложение.УстановитьСоединение();
			Подключен = Истина;
			Прервать;
		Исключение
			ОписаниеОшибкиСоединения = ОписаниеОшибки();
		КонецПопытки;
	КонецЦикла;
	Если Не Подключен Тогда
		ТестовоеПриложение = Неопределено;
		Сообщить("Не смогли установить соединение! " + Символы.ПС + ОписаниеОшибкиСоединения);
		Возврат;
	КонецЕсли;

	ОкноПриложенияОсновноеКнопкаКомандногоИнтерфейсаПоискCtrlShiftFНажать(ТестовоеПриложение);
	ОкноПриложенияПоискКнопкаНайтиАктивизировать(ТестовоеПриложение);

КонецПроцедуры

&НаКлиенте
Процедура ОкноПриложенияОсновноеКнопкаКомандногоИнтерфейсаПоискCtrlShiftFНажать(ТестовоеПриложение)
	
	ОкноПриложенияОсновное = Неопределено;
	КлиентсткиеОкнаТестируемогоПриложения = ТестовоеПриложение.ПолучитьПодчиненныеОбъекты();
	Для Каждого ТестируемоеОкно Из КлиентсткиеОкнаТестируемогоПриложения Цикл
		Если ТестируемоеОкно.Основное Тогда
			ОкноПриложенияОсновное = ТестируемоеОкно;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	ОкноПриложенияОсновноеCommandInterface = ОкноПриложенияОсновное.ПолучитьКомандныйИнтерфейс();
	КнопкаКомандногоИнтерфейсаПоискCtrlShiftF = ОкноПриложенияОсновноеCommandInterface.НайтиОбъект(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"), "Поиск (Ctrl+Shift+F)");
	КнопкаКомандногоИнтерфейсаПоискCtrlShiftF.Нажать();

КонецПроцедуры

&НаКлиенте
Процедура ОкноПриложенияПоискКнопкаНайтиАктивизировать(ТестовоеПриложение)

	ОкноПриложенияПоиск = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Поиск", , 30);
	ОкноПриложенияПоискФормаПоиск = ОкноПриложенияПоиск.НайтиОбъект(Тип("ТестируемаяФорма"), "Поиск");
	ПолеСтрокаПоиска = ОкноПриложенияПоискФормаПоиск.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "СтрокаПоиска");
	ПолеСтрокаПоиска.ВвестиТекст("счастье");

	ОкноПриложенияПоискФормаПоиск.ПерейтиКСледующемуЭлементу();

	КнопкаНайти = ОкноПриложенияПоискФормаПоиск.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Найти");
	КнопкаНайти.Активизировать();

КонецПроцедуры



