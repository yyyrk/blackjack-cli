# 🃏 Blackjack CLI

**Blackjack CLI** — консольная карточная игра, созданная для практики работы с языком **Ruby**. Это увлекательный способ изучить основы программирования и поиграть в классическую карточную игру.

---

## 🎯 Цели проекта

Проект выполнен с соблюдением рекомендаций:  
- 💡 Избегать **God classes** и избыточных классов.  
- 📁 Работать в отдельном репозитории.  
- 📝 Делать множество мелких коммитов.  
- 🔍 Тщательно анализировать задачу и разбивать её на подзадачи.  
- 🏗️ Проектировать объектную модель заранее.  

---

## 🕹️ Как играть

### Общие правила:
- В игре участвуют два игрока: **пользователь** и **дилер** (управляемый программой).  
- У каждого игрока в начале есть банк по **100 долларов**.  
- Выдаётся по две случайные карты:  
  - У пользователя карты видны.  
  - У дилера карты скрыты (показываются как "звёздочки").  

### Карты и очки:
- **Номинал карт**:
  - От 2 до 10 — по номиналу.
  - "Картинки" (валет, дама, король) — **10 очков**.
  - Туз — **1 или 11 очков**, в зависимости от ситуации.  

### Ходы:
- Игрок выбирает действия:
  1. **Пропустить** — ход переходит к дилеру.
  2. **Взять карту** — добавляется карта, ход переходит дилеру (можно один раз за раунд).  
  3. **Открыть карты** — подсчитываются результаты.

- **Дилер** действует автоматически:
  - Пропускает ход, если очков **17 и больше**.  
  - Берёт карту, если очков меньше **17** (только один раз за раунд).  

### Результат:
- Побеждает игрок с суммой ближе к **21**.
- Сумма больше **21** означает проигрыш.  
- В случае равенства объявляется ничья, банк возвращается игрокам.  
- Победитель забирает весь банк игры.

---

## 🚀 Установка и запуск

### 1. Клонируйте репозиторий:

```bash
git clone https://github.com/yyyrk/blackjack-cli.git
```

2. Перейдите в директорию проекта:

```bash
cd blackjack-cli
```

3. Запустите игру:

```bash
ruby main.rb
```

### 👶 Инструкция для начинающих
1. Запустите программу.
2. Следуйте подсказкам в консоли:
   - Вводите цифру, чтобы выбрать действие.
   - Наблюдайте за ходами дилера.
   - Открывайте карты, чтобы узнать результат раунда!
   - Игра автоматически спросит, хотите ли вы начать новый раунд.

Удачи! 🍀

### 🛠️ Технологии
Язык: Ruby
Версия Ruby: Убедитесь, что у вас установлена актуальная версия Ruby (рекомендуется >= 2.7).
💬 Обратная связь
Если у вас есть идеи, как улучшить проект, создайте Issue или отправьте Pull Request.

**🎉 Спасибо за интерес к проекту!
**
