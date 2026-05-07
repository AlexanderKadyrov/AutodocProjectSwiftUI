# AutodocProjectSwiftUI - тестовое задание

Перевод тестового задания AutodocProject UIKit на SwiftUI

### Ссылка AutodocProject UIKit
![](https://github.com/AlexanderKadyrov/AutodocProject

# Описание

Данный код демонстрирует некоторые навыки работы со SwiftUI и CoreData.

Проект выполнен в модульном стиле с использованием нескольких слоев, каждый из которых разбит на логические модули.

Такой подход обусловлен тем, чтобы раскрыть умения автора делить проект на логические модули с применением инструмента менеджера зависимостей SPM.

Все модули выполнены автором данного проекта и нет сторонних зависимостей других авторов.

# SPM

В проекте используются следующие логические модули:

### Network
Сетевой слой для работы с сетевыми запросов и кеширующей загрузкой изображений, включает в себя модуль внедрения зависимостей **DI**
```https://github.com/AlexanderKadyrov/Network```

### DI
Реализация внедрения зависимостей (Dependency Injection) с использованием **@propertyWrapper**, используется для сервисов и контроллеров
```https://github.com/AlexanderKadyrov/DI```

### iOS Portrait
![](https://github.com/AlexanderKadyrov/AutodocProjectSwiftUI/blob/master/Screenshots/screenshot_1.png?raw=true)