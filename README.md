# Blackjack CLI

Карточная игра в консольном исполнении, созданная для закрепления навыков работы с языком Ruby. 

## Задание

Проект выполнен по следующему заданию (важное дополнение: избегать **God classes** или избыточных классов).

### Рекомендации по выполнению проекта

- Выполняй проект в отдельном репозитории.
- Делай много мелких коммитов в процессе работы.
- Проведи тщательный анализ задачи и разбей её на подзадачи.
- Начни с проектирования объектной модели: какие классы понадобятся, за что они будут отвечать и как они будут связаны.
- Начинай разработку с наиболее простой и понятной для тебя части.

---

## Механика и правила игры

В игре участвуют два игрока: пользователь и дилер (управляемый программой).

1. **Начало игры**
   - У пользователя и дилера в банке находится по 100 долларов.
   - Каждому участнику выдается две случайные карты:
     - Карты пользователя отображаются в формате, например, `К+` (король крестей), `К<3` (король червей) и т.д. Можно использовать символы Юникод для мастей.
     - Карты дилера скрыты (отображаются звёздочками).
   - Пользователь видит сумму своих очков:
     - Карты с номиналом от 2 до 10 считаются по номиналу.
     - "Картинки" (`В`, `Д`, `К`) считаются за 10 очков.
     - Туз (`Т`) считается за 1 или 11, в зависимости от того, какое значение будет ближе к 21, не превышая его.

2. **Ставка**
   - Каждый участник делает ставку в размере 10 долларов.
   - Ставка списывается из банка игрока и дилера.

3. **Действия игрока**
   Пользователю доступны три варианта действий:
   - **Пропустить**: ход переходит к дилеру.
   - **Взять карту** (если у пользователя 2 карты): добавляется еще одна случайная карта, пересчитывается сумма очков, и ход переходит к дилеру. Взять карту можно только один раз.
   - **Открыть карты**: оба участника открывают карты, происходит подсчёт результатов.

4. **Ход дилера**
   Дилер действует в зависимости от суммы очков:
   - Если у дилера 17 очков или больше — он пропускает ход, передавая его пользователю.
   - Если у дилера меньше 17 очков — он берет карту (для пользователя она остается скрытой). Взять карту можно только один раз.

5. **Открытие карт**
   - Карты открываются, если у обоих участников по 3 карты, либо если пользователь выбрал действие «Открыть карты».
   - Открываются карты дилера и отображается его сумма очков.

6. **Подсчет результатов**
   - Побеждает тот, чья сумма очков ближе к 21.
   - Игрок проигрывает, если сумма его очков превышает 21.
   - Если сумма очков равна у игрока и дилера — объявляется ничья, деньги возвращаются участникам.
   - Победитель получает сумму из банка игры.

---

## Завершение игры

После подсчёта результатов программа спрашивает у пользователя, хочет ли он сыграть ещё раз:
- Если **да**, игра начинается заново с раздачи карт.
- Если **нет**, программа завершает свою работу.

---

## Технические детали

### Объектная модель

В проекте используется следующая объектная модель:

1. **Player**  
   - Представляет игрока (пользователя или дилера).
   - Содержит информацию о картах, сумме очков и балансе.
   - Отвечает за расчет очков и управление картами.

2. **Card**  
   - Представляет отдельную карту с номиналом и мастью.
   - Содержит логику для отображения карты (например, символ масти).

3. **Deck**  
   - Отвечает за хранение и выдачу карт.
   - Содержит стандартную колоду (52 карты) и обеспечивает случайное распределение карт.

4. **Game**  
   - Основной игровой процесс.
   - Управляет ходами игроков, ставками и подсчётом результатов.

### Основные фишки реализации

- Карты отображаются с использованием Unicode-символов для удобства и наглядности.
- Вся логика игры разделена на небольшие классы с чёткими зонами ответственности, что упрощает поддержку и тестирование.
- Реализована защита от некорректного ввода со стороны пользователя.

---

## Как запустить проект

### Требования

- Установленный интерпретатор [Ruby](https://www.ruby-lang.org) версии 3.0 или выше.

### Установка

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/your-username/blackjack-cli.git
   ---

   Перейдите в директорию проекта:
   ```bash
Копировать
Редактировать
cd blackjack-cli
Установите зависимости (если они есть):
   ```bash
Копировать
Редактировать
bundle install
Запуск
Запустите приложение командой:

   ```bash
Копировать
Редактировать
ruby main.rb
Следуйте инструкциям в консоли, чтобы начать игру.
