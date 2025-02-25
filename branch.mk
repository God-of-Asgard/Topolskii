
## Инструкция по работе с ветками в Git

Ветки в Git позволяют изолированно разрабатывать новые функции, исправлять ошибки или проводить эксперименты, не затрагивая основную кодовую базу (обычно ветку `main` или `master`).

### Основные команды для работы с ветками

*   `git branch`:  Список локальных веток.  Добавьте флаг `-a` (`git branch -a`) для просмотра всех веток (локальных и удаленных).
*   `git branch <имя_ветки>`: Создание новой ветки с указанным именем.
*   `git checkout <имя_ветки>`: Переключение на существующую ветку.
*   `git checkout -b <имя_ветки>`: Создание новой ветки и автоматическое переключение на неё.
*   `git merge <имя_ветки>`:  Слияние указанной ветки с текущей веткой.
*   `git branch -d <имя_ветки>`: Удаление ветки (только если она была слита с текущей веткой).
*   `git branch -D <имя_ветки>`:  Принудительное удаление ветки (даже если она не была слита).  **Используйте осторожно!**
*   `git push origin <имя_ветки>`: Отправка локальной ветки на удаленный репозиторий (например, GitHub).
*   `git pull origin <имя_ветки>`: Получение изменений из удаленной ветки и слияние их с текущей локальной веткой.
*   `git push origin --delete <имя_ветки>`: Удаление удаленной ветки.

### Основной рабочий процесс с ветками

1.  **Создайте новую ветку:** Перед началом разработки новой функции или исправления ошибки создайте новую ветку от основной ветки (например, `main`).


bash
  git checkout main # Убедитесь, что вы находитесь в основной ветке
  git pull origin main # Получите последние изменения из удаленного репозитория
  git checkout -b feature/new-feature # Создайте и переключитесь на новую ветку

```

  Здесь feature/new-feature - это пример имени ветки. Рекомендуется использовать префикс (например, feature/, bugfix/, hotfix/) для организации веток.

2. Внесите изменения и сделайте коммиты: Работайте в своей новой ветке, вносите изменения, добавляйте их в индекс и делайте коммиты.

  
```
bash
  # ... внесите изменения в файлы ...
  git add .    # Добавьте все измененные файлы в индекс
  git commit -m "Добавьте новую функциональность"
```

3. Отправьте ветку на удаленный репозиторий (если необходимо): Если вы хотите поделиться своей работой с другими или использовать CI/CD, отправьте ветку на удаленный репозиторий.

  
```
bash
  git push origin feature/new-feature

```

4. Слияние ветки (Merge): Когда разработка функции завершена и протестирована, её необходимо слить с основной веткой.

  •  Pull Request (Рекомендуется): Создайте Pull Request на GitHub (или в вашей системе контроля версий). Это позволит другим разработчикам проверить ваш код перед слиянием. После одобрения Pull Request можно слить ветку через веб-интерфейс.

  •  Слияние через командную строку: Если Pull Request не требуется, можно слить ветку локально и затем отправить изменения на удаленный репозиторий.

    
```
bash
    git checkout main    # Переключитесь на основную ветку
    git pull origin main # Получите последние изменения
    git merge feature/new-feature # Слейте ветку feature/new-feature
    git push origin main # Отправьте изменения на удаленный репозиторий
```

    В процессе слияния могут возникнуть конфликты, которые необходимо разрешить. Git предоставит информацию о файлах с конфликтами. После разрешения конфликтов добавьте измененные файлы в индекс и сделайте коммит:

    
```
bash
    # ... разрешите конфликты в файлах ...
    git add .
    git commit -m "Разрешены конфликты слияния"
    git push origin main
```

5. Удалите ветку: После успешного слияния ветку можно удалить (как локально, так и удаленно).

  
```
bash
  git branch -d feature/new-feature # Удалите локальную ветку
  git push origin --delete feature/new-feature # Удалите удаленную ветку
```

▌Разрешение конфликтов слияния

Конфликты слияния возникают, когда Git не может автоматически определить, какие изменения следует применить. Обычно это происходит, когда один и тот же файл был изменен в разных ветках.

1. Найдите конфликтные файлы: После попытки слияния Git укажет файлы, в которых возникли конфликты.

2. Откройте конфликтные файлы в текстовом редакторе: Внутри файла вы увидите маркеры конфликтов:

  
```
<<<<<<< HEAD
    Изменения в текущей ветке (например, main)
    =======
    Изменения в сливаемой ветке (например, feature/new-feature)
    >>>>>>> feature/new-feature

3.  **Отредактируйте файл, чтобы разрешить конфликт:** Удалите маркеры конфликтов (<<<<<<<, =======, >>>>>>>) и оставьте только нужный код.  Вам может потребоваться объединить изменения из обеих веток или выбрать только одну из них.

4.  **Добавьте разрешенные файлы в индекс и сделайте коммит:**
bash
    git add <имя_файла>
    git commit -m "Разрешены конфликты слияния в файле <имя_файла>"
```

5. Продолжите слияние: После разрешения всех конфликтов слияние будет завершено.

▌Советы

•  Регулярно обновляйте основную ветку (main) в своих локальных ветках (git pull origin main) для минимизации конфликтов слияния.
•  Делайте небольшие, логически завершенные коммиты.
•  Используйте информативные сообщения для коммитов.
•  При работе в команде используйте Pull Requests для обзора кода.
•  Прежде чем удалять ветку, убедитесь, что она была успешно слита.


```
ТАкжн не забывайте комиттить все изменения