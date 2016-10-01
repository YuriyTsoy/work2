﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьВозрастЧеловекаВГодах(Парам01)","УМеняЕстьВозрастЧеловекаВГодах","Допустим у меня есть возраст человека в годах 23");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозрастЧеловекаВМесяцах(Парам01)","ВозрастЧеловекаВМесяцах","Тогда возраст человека в месяцах 276");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим у меня есть возраст человека в годах 23
//@УМеняЕстьВозрастЧеловекаВГодах(Парам01)
Процедура УМеняЕстьВозрастЧеловекаВГодах(ВозрастВГодах) Экспорт
	Контекст.Вставить("ВозрастВГодах", ВозрастВГодах); 
КонецПроцедуры

&НаКлиенте
//Тогда возраст человека в месяцах 276
//@ВозрастЧеловекаВМесяцах(Парам01)
Процедура ВозрастЧеловекаВМесяцах(ОжидаемыйРезультат) Экспорт
	Результат = ОбщийМодуль1.ПолучитьРасчетВозрастаЧеловекаВМесяцах(Контекст.ВозрастВГодах); 
	Если НЕ Результат = ОжидаемыйРезультат Тогда
		ВызватьИсключение "Результат рассчитан не верно";	
	КонецЕсли; 	
КонецПроцедуры

//окончание текста модуля