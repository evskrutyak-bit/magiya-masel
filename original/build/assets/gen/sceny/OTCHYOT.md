# Отчёт по генерации сцен

Режим: встроенный `image_gen` с референсными изображениями. `scripts/image_gen.py` не использовался. Финальные PNG перенесены из `$CODEX_HOME/generated_images/` в эту папку.

Художественная приёмка не проводилась. Проверены только явно заданные технические признаки: число попыток, отсутствие знаков на этикетках и свободная левая половина `scena-hero.png`.

## 1. scena-hero.png

- Размер: 1672 × 941 px.
- Попыток: 2.
- Этикетка: пустая, без букв, цифр, логотипа, орнамента и ботаники.
- Левая половина: свободна. В попытке 1 отдельные орешки заходили в левую половину; попытка 2 устранила это нарушение.

### Точный запрос — попытка 1

```text
Use case: product-mockup
Asset type: landing page hero image for the «Магия Масел» website
Primary request: Вид сверху, высокая бутылка тёмного стекла с ПУСТОЙ тёмно-зелёной этикеткой без всякого текста лежит по диагонали на плотной россыпи кедровых орешков, рядом еловая хвоя и шишка, тёплый охристо-песочный ровный фон, мягкий рассеянный свет, вся композиция в правой половине кадра, левая половина пустая и ровная под текст, натуральная предметная съёмка без глянца и 3D, широкий кадр 16:9
Input images: Images 1 and 2 are strict bottle-form and blank-label references: preserve the tall rectangular shape, very dark almost black glass, dark green cap, narrow dark-green label field with an arched top. Image 3 is a staging reference only for the overhead diagonal bottle among pine nuts, spruce needles and cone; ignore and do not reproduce any text, logo, label design, or its portrait framing.
Scene/backdrop: warm ochre-sand, perfectly even matte surface.
Subject: exactly one tall rectangular bottle lying diagonally on a dense scatter of pine nuts, with spruce needles and exactly one cone beside it. Oil is dark amber, almost brown; glass is dark, almost black when light passes through it.
Composition/framing: strict top-down view; wide horizontal 16:9. Bottle and every prop must stay entirely within the RIGHT HALF of the frame. The entire LEFT HALF must remain empty, clean and even ochre surface with no objects, shadows, seeds, needles, cone, texture marks or decoration, reserved for website copy. This left-side negative space is the highest-priority composition constraint.
Lighting/mood: soft diffused light from above, restrained natural food/product photography.
Label invariant: the label on the bottle is a completely blank, uniform dark-green field with an arched top. There are NO letters, NO numbers, NO words, NO logo, NO ornament, NO botanical drawing, NO border, NO frame, NO strokes, NO symbols, NO texture, NO embossing and NO marks of any kind on the label. The empty label is the intended finished result.
Constraints and prohibitions — follow every line exactly:
Любых букв, цифр, надписей и логотипов — нет нигде в кадре, включая этикетку.
Ботаники и орнамента на этикетке — нет.
Чужих логотипов и торговых марок — нет.
Вывесок, витрин, прилавков, ценников, чужого товара — нет.
Людей и рук — нет.
Оливок, оливковых ветвей, оливковых листьев, оливкового масла — нет.
Средиземноморских мотивов: терракотовой черепицы, белёного камня, лимонов — нет.
Прессов, машин, механизмов — нет.
3D-рендера, глянца, octane, пластиковых бликов — нет.
ЦВЕТ: масло тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет.
⛔ golden amber, golden oil, extra virgin — запрещённые формулировки.
```

### Точный запрос — попытка 2

```text
Use case: precise-object-edit
Asset type: landing page hero image for the «Магия Масел» website
Primary request: Исправить только компоновку предыдущего hero-кадра. Сохранить тот же вид строго сверху, ту же высокую бутылку тёмного стекла с полностью ПУСТОЙ тёмно-зелёной этикеткой, ту же плотную россыпь кедровых орешков, еловую хвою, одну шишку, тёплый охристо-песочный ровный фон и мягкий рассеянный свет. Переместить бутылку и абсолютно все предметы вправо так, чтобы они начинались только после 55% ширины кадра. Левая половина кадра от x=0% до x=50% должна быть совершенно пустой и ровной; дополнительно оставить чистый буфер от x=50% до x=55%. Никаких орешков, хвои, шишек, теней, следов, текстурных акцентов и предметов левее x=55%. Бутылка по диагонали. Натуральная предметная съёмка без глянца и 3D. Широкий кадр 16:9.
Composition/framing: strict top-down view; wide horizontal 16:9. Bottle and every prop must stay entirely within the RIGHTMOST 45% of the frame. The entire LEFT 55% must remain empty, clean and even ochre surface reserved for website copy. This is the highest-priority invariant.
Label invariant: the label remains a completely blank, uniform dark-green field with an arched top. There are NO letters, NO numbers, NO words, NO logo, NO ornament, NO botanical drawing, NO border, NO frame, NO strokes, NO symbols, NO texture, NO embossing and NO marks of any kind on the label. The empty label is the intended finished result.
Bottle/color invariant: keep the tall rectangular bottle, dark-green cap, oil dark amber almost brown, glass dark almost black when light passes through it.
Constraints and prohibitions — follow every line exactly:
Любых букв, цифр, надписей и логотипов — нет нигде в кадре, включая этикетку.
Ботаники и орнамента на этикетке — нет.
Чужих логотипов и торговых марок — нет.
Вывесок, витрин, прилавков, ценников, чужого товара — нет.
Людей и рук — нет.
Оливок, оливковых ветвей, оливковых листьев, оливкового масла — нет.
Средиземноморских мотивов: терракотовой черепицы, белёного камня, лимонов — нет.
Прессов, машин, механизмов — нет.
3D-рендера, глянца, octane, пластиковых бликов — нет.
ЦВЕТ: масло тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет.
⛔ golden amber, golden oil, extra virgin — запрещённые формулировки.
```

## 2. scena-linejka.png

- Размер: 1536 × 1024 px.
- Попыток: 1.
- Этикетки: все пять пустые, без букв, цифр, логотипов, орнамента и ботаники.
- Левая половина: не применимо.

### Точный запрос

```text
Use case: product-mockup
Asset type: website product-line scene
Primary request: Плоская выкладка сверху на чистом белом фоне: пять высоких бутылок тёмного стекла с ПУСТЫМИ тёмно-зелёными этикетками без текста лежат веером, вокруг горки тыквенных семечек и чёрного тмина, грецкие орехи, веточка розмарина, свежий шпинат, кедровые орешки в керамической мисочке, плетёная соломенная салфетка, ровный дневной свет, мягкие тени, натуральная предметная съёмка без глянца и 3D, горизонтальный кадр 3:2
Input images: Images 1 and 2 are strict bottle-form and blank-label references: preserve the tall rectangular shape, very dark almost black glass, dark green cap, narrow dark-green label field with an arched top. Image 3 is a staging reference only for the top-down five-bottle flat lay with ingredients on white; ignore and do not reproduce any printed label, text, logo, brand mark, tomatoes or extra products from it.
Scene/backdrop: clean plain white background.
Subject: exactly five tall rectangular dark-glass bottles lying in a fan arrangement; around them one mound of pumpkin seeds, one mound of black cumin seeds, several walnuts, one rosemary sprig, a bunch of fresh spinach, pine nuts in one small ceramic bowl, and one woven straw placemat. Oil inside every bottle is dark amber, almost brown; glass is dark, almost black when light passes through it.
Composition/framing: strict top-down flat lay, composition fills the frame, horizontal 3:2.
Lighting/mood: even natural daylight with light soft shadows, restrained natural food/product photography.
Label invariant: every bottle has a completely blank, uniform dark-green label field with an arched top. There are NO letters, NO numbers, NO words, NO logo, NO ornament, NO botanical drawing, NO border, NO frame, NO strokes, NO symbols, NO texture, NO embossing and NO marks of any kind on any label. Empty labels are the intended finished result.
Constraints and prohibitions — follow every line exactly:
Любых букв, цифр, надписей и логотипов — нет нигде в кадре, включая этикетку.
Ботаники и орнамента на этикетке — нет.
Чужих логотипов и торговых марок — нет.
Вывесок, витрин, прилавков, ценников, чужого товара — нет.
Людей и рук — нет.
Оливок, оливковых ветвей, оливковых листьев, оливкового масла — нет.
Средиземноморских мотивов: терракотовой черепицы, белёного камня, лимонов — нет.
Прессов, машин, механизмов — нет.
3D-рендера, глянца, octane, пластиковых бликов — нет.
ЦВЕТ: масло тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет.
⛔ golden amber, golden oil, extra virgin — запрещённые формулировки.
```

## 3. scena-odna-poziciya.png

- Размер: 1122 × 1402 px.
- Попыток: 1.
- Этикетки: обе пустые, без букв, цифр, логотипов, орнамента и ботаники.
- Левая половина: не применимо.

### Точный запрос

```text
Use case: product-mockup
Asset type: website single-product scene
Primary request: Предметная съёмка, одна высокая бутылка тёмного стекла с ПУСТОЙ тёмно-зелёной этикеткой без текста стоит на переднем плане, вторая чуть позади, рядом светлая керамическая тарелка с тремя кедровыми шишками и россыпью кедровых орешков, светлая серо-бежевая стена в расфокусе, мягкий боковой свет, натуральная предметная съёмка без глянца и 3D, вертикальный кадр 4:5
Input images: Images 1 and 2 are strict bottle-form and blank-label references: preserve the tall rectangular shape, very dark almost black glass, dark green cap, narrow dark-green label field with an arched top. Image 3 is a staging reference only for the standing bottle arrangement, ceramic plate, cones, shallow depth of field and soft side light; ignore and do not reproduce its paper-wrapped caps, printed labels, text, logos, drawings, or portrait aspect ratio.
Scene/backdrop: tabletop before a light gray-beige wall with gentle shallow-focus blur.
Subject: exactly two tall rectangular bottles. One stands in front; the second stands slightly behind and lower in the composition. Beside them is one light ceramic plate holding exactly three pine cones and a scatter of pine nuts. Oil is dark amber, almost brown; glass is dark, almost black when light passes through it.
Composition/framing: centered composition, vertical 4:5.
Lighting/mood: soft natural side light, restrained realistic product photography.
Label invariant: both bottles have a completely blank, uniform dark-green label field with an arched top. There are NO letters, NO numbers, NO words, NO logo, NO ornament, NO botanical drawing, NO border, NO frame, NO strokes, NO symbols, NO texture, NO embossing and NO marks of any kind on either label. Empty labels are the intended finished result.
Constraints and prohibitions — follow every line exactly:
Любых букв, цифр, надписей и логотипов — нет нигде в кадре, включая этикетку.
Ботаники и орнамента на этикетке — нет.
Чужих логотипов и торговых марок — нет.
Вывесок, витрин, прилавков, ценников, чужого товара — нет.
Людей и рук — нет.
Оливок, оливковых ветвей, оливковых листьев, оливкового масла — нет.
Средиземноморских мотивов: терракотовой черепицы, белёного камня, лимонов — нет.
Прессов, машин, механизмов — нет.
3D-рендера, глянца, octane, пластиковых бликов — нет.
ЦВЕТ: масло тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет.
⛔ golden amber, golden oil, extra virgin — запрещённые формулировки.
```

## 4. scena-semena-lozhka.png

- Размер: 1536 × 1024 px.
- Попыток: 1.
- Этикетка: не применимо, бутылок в кадре нет.
- Левая половина: не применимо.

### Точный запрос

```text
Use case: photorealistic-natural
Asset type: website raw-ingredient scene
Primary request: Вид строго сверху, деревянная ложка с горкой семян чёрного тмина на чистом белом фоне, вокруг россыпь тех же семян, ровный дневной свет, одна чёткая мягкая тень, минимализм, ничего лишнего, натуральная предметная съёмка без глянца и 3D, горизонтальный кадр 3:2
Input images: Image 1 is a staging reference only for the strict top-down wooden spoon, seed scatter, white background and simple natural lighting. Use true black cumin seeds (Nigella sativa): small matte angular jet-black seeds, not chia seeds. Do not reproduce any text, logo, watermark or extra object from the reference.
Scene/backdrop: clean plain white surface.
Subject: exactly one simple wooden spoon holding a mound of black cumin seeds, surrounded by a natural picturesque scatter of the same seeds. No bottles.
Composition/framing: strict top-down view, minimal composition, horizontal 3:2.
Lighting/mood: even natural daylight, one defined but soft shadow, realistic restrained food photography.
Constraints and prohibitions — follow every line exactly:
Любых букв, цифр, надписей и логотипов — нет нигде в кадре, включая этикетку.
Ботаники и орнамента на этикетке — нет.
Чужих логотипов и торговых марок — нет.
Вывесок, витрин, прилавков, ценников, чужого товара — нет.
Людей и рук — нет.
Оливок, оливковых ветвей, оливковых листьев, оливкового масла — нет.
Средиземноморских мотивов: терракотовой черепицы, белёного камня, лимонов — нет.
Прессов, машин, механизмов — нет.
3D-рендера, глянца, octane, пластиковых бликов — нет.
ЦВЕТ: масло тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет.
⛔ golden amber, golden oil, extra virgin — запрещённые формулировки.
```

## 5. scena-orehi-derevo.png

- Размер: 1536 × 1024 px.
- Попыток: 1.
- Этикетка: не применимо, бутылок в кадре нет.
- Левая половина: не применимо.

### Точный запрос

```text
Use case: photorealistic-natural
Asset type: website raw-ingredient scene
Primary request: Вид строго сверху на тёмную состаренную деревянную доску, грецкие орехи целые и расколотые половинки с видимым ядром, тёплый боковой свет, глубокие мягкие тени, натуральная предметная съёмка без глянца и 3D, горизонтальный кадр 3:2
Input images: Image 1 is a staging reference only for the overhead walnuts on aged dark wood, natural textures and tonal mood. Ignore its portrait framing and any watermark or text; reproduce no writing or marks.
Scene/backdrop: dark aged wooden board with authentic grain, wear and matte texture.
Subject: only walnuts: several whole walnuts and several cleanly cracked shell halves with the walnut kernel clearly visible. No bottles.
Composition/framing: strict top-down view, horizontal 3:2.
Lighting/mood: warm side light with deep soft shadows, restrained realistic food photography.
Constraints and prohibitions — follow every line exactly:
Любых букв, цифр, надписей и логотипов — нет нигде в кадре, включая этикетку.
Ботаники и орнамента на этикетке — нет.
Чужих логотипов и торговых марок — нет.
Вывесок, витрин, прилавков, ценников, чужого товара — нет.
Людей и рук — нет.
Оливок, оливковых ветвей, оливковых листьев, оливкового масла — нет.
Средиземноморских мотивов: терракотовой черепицы, белёного камня, лимонов — нет.
Прессов, машин, механизмов — нет.
3D-рендера, глянца, octane, пластиковых бликов — нет.
ЦВЕТ: масло тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет.
⛔ golden amber, golden oil, extra virgin — запрещённые формулировки.
```

## 6. scena-polka.png

- Размер: 1672 × 941 px.
- Попыток: 1.
- Режим: встроенный `image_gen` с тремя локальными референсами; `scripts/image_gen.py` не использовался.
- Исходный файл `$CODEX_HOME`: `/Users/admin/.codex/generated_images/01a09f49-ca87-7251-b645-0bd29e4c5c97/exec-874e2f4c-3d40-4358-8a59-e756ef8afba7.png`.
- Итоговый файл: `/Users/admin/studio-v3/clients/kirill-masla/2-fk/sayt-masla/build/assets/gen/sceny/scena-polka.png`.
- SHA-256: `b042d8237832a8446043da738f03b9c8fb7efd3ea1568b919c9c962c8d69492e`.
- Визуальная приёмка: не проводилась; оставлена для другой сессии по указанию заказчика.

### Точный запрос

```text
Use case: product-mockup. Asset type: первый экран сайта «Магия Масел», широкая горизонтальная предметная фотография 16:9. Image 1: референс точной высокой формы бутылки, тёмного почти чёрного стекла, тёмно-зелёной крышки и формы этикетки с аркой сверху; Image 2: референс постановки линейки бутылок с натуральным сырьём; Image 3: референс светлого естественного регистра, мягкого света и натуральной фактуры. Горизонтальный предметный кадр: ровно пять высоких бутылок тёмного почти чёрного стекла с тёмно-зелёными крышками и ПУСТЫМИ ровными тёмно-зелёными этикетками с аркой сверху стоят вертикально в ряд по пологой дуге только в правой половине кадра на светлой песочной поверхности, ближние бутылки чуть крупнее. Масло внутри тёмно-янтарное, почти коричневое; стекло тёмное, почти чёрное на просвет. У основания бутылок только указанные ингредиенты: отдельная горка тыквенных семечек, отдельная горка семян чёрного тмина, несколько кедровых орешков, пара грецких орехов, одна веточка розмарина. Фон — ровная кремовая стена в лёгком расфокусе. Мягкий естественный боковой свет слева, от бутылок идут длинные мягкие тени вправо. КРИТИЧЕСКАЯ КОМПОЗИЦИЯ: бутылки, сырьё и все визуальные акценты целиком занимают ПРАВУЮ ПОЛОВИНУ кадра; ЛЕВАЯ ПОЛОВИНА полностью пустая и светлая, только непрерывная песочная поверхность и кремовая стена, без единого предмета, без ярких пятен, без резких переходов света, чистое негативное пространство под заголовок сайта. Этикетки абсолютно пустые: ровное однотонное тёмно-зелёное поле с аркой сверху, без букв, цифр, надписей, логотипов, орнамента, ботаники и рамки. Натуральная предметная съёмка, естественная фактура, сдержанный матовый фотографический вид. Запреты: никаких букв, цифр, надписей, логотипов или водяных знаков нигде; никаких торговых марок; никаких вывесок, витрин, прилавков, ценников и чужого товара; никаких людей и рук; никаких оливок, оливковых ветвей, оливковых листьев и оливкового масла; никаких средиземноморских мотивов, терракотовой черепицы, белёного камня и лимонов; никаких прессов, машин и механизмов; никаких лишних ингредиентов или предметов; не 3D-рендер, не иллюстрация, без рекламного глянца, без пластиковых бликов.
```
