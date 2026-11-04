-- ==============================================================================
-- СХЕМА БАЗЫ ДАННЫХ ДЛЯ САЙТА «МАГИЯ МАСЕЛ» (SUPABASE / POSTGRESQL)
-- Курс: «Claude Code: сайт от дизайна до CMS» — Модуль 4, Урок 13
-- ==============================================================================

-- 1. ТАБЛИЦА: Витрина масел и цены
CREATE TABLE IF NOT EXISTS public.oils (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sub VARCHAR(255) NOT NULL,
    p100 VARCHAR(50) NOT NULL,
    p250 VARCHAR(50) NOT NULL,
    p500 VARCHAR(50) NOT NULL,
    in_stock BOOLEAN DEFAULT TRUE,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. ТАБЛИЦА: Статус прилавка и свежий отжим
CREATE TABLE IF NOT EXISTS public.market_status (
    id INT PRIMARY KEY DEFAULT 1,
    status VARCHAR(50) DEFAULT 'open', -- 'open' (открыто), 'busy' (отжим), 'closed' (закрыто)
    hours VARCHAR(255) DEFAULT 'Вторник – Воскресенье: 9:00–19:00 (Пн — выходной)',
    next_press VARCHAR(255) DEFAULT 'Сегодня в 14:00 и 17:30',
    announcement TEXT DEFAULT 'Сегодня в прессе: сыродавленный чёрный тмин свежей партии (Эфиопия)',
    show_badge BOOLEAN DEFAULT TRUE,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. ТАБЛИЦА: Контакты и SEO
CREATE TABLE IF NOT EXISTS public.contacts_seo (
    id INT PRIMARY KEY DEFAULT 1,
    phone VARCHAR(50) DEFAULT '+7 (921) 123-45-67',
    telegram VARCHAR(100) DEFAULT '@magiyamasel_kld',
    address TEXT DEFAULT 'Калининград, ул. Черняховского, 15 (Центральный рынок)',
    location_hint TEXT DEFAULT 'Павильон молочных продуктов, центральный проход, место 12',
    seo_title TEXT DEFAULT 'Магия Масел — Попробуйте живое масло холодного отжима | Калининград',
    seo_description TEXT DEFAULT 'Попробуйте живое масло холодного отжима. Отжимаем при вас из цельного семени и ореха на Центральном рынке Калининграда, 9:00–19:00.',
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ==============================================================================
-- БЕЗОПАСНОСТЬ: Row Level Security (RLS)
-- Публичные гости могут только читать, администраторы могут менять
-- ==============================================================================

ALTER TABLE public.oils ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.market_status ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.contacts_seo ENABLE ROW LEVEL SECURITY;

-- Разрешить всем посетителям читать витрину
CREATE POLICY "Allow public read access on oils" ON public.oils FOR SELECT USING (true);
CREATE POLICY "Allow public read access on market_status" ON public.market_status FOR SELECT USING (true);
CREATE POLICY "Allow public read access on contacts_seo" ON public.contacts_seo FOR SELECT USING (true);

-- Разрешить авторизованным администраторам изменять данные
CREATE POLICY "Allow admin full access on oils" ON public.oils FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access on market_status" ON public.market_status FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access on contacts_seo" ON public.contacts_seo FOR ALL USING (auth.role() = 'authenticated');

-- ==============================================================================
-- НАЧАЛЬНЫЕ ДАННЫЕ (SEED MIGRATION)
-- ==============================================================================

INSERT INTO public.oils (name, sub, p100, p250, p500, in_stock, sort_order)
VALUES
    ('Льняное масло', 'Золотистый лён, мягкий вкус', '250 ₽', '450 ₽', '800 ₽', true, 1),
    ('Масло чёрного тмина', 'Эфиопский сорт, терпкое', '900 ₽', '1 900 ₽', '3 500 ₽', true, 2),
    ('Тыквенное масло', 'Штирийская голосемянная', '600 ₽', '1 300 ₽', '2 400 ₽', true, 3),
    ('Кунжутное масло', 'Светлый кунжут, сладковатый тон', '400 ₽', '850 ₽', '1 500 ₽', true, 4),
    ('Кедровое масло', 'Таёжный орех, ручной отжим', '1 200 ₽', '2 600 ₽', '4 900 ₽', true, 5),
    ('Конопляное масло', 'Пищевая конопля, ореховый тон', '500 ₽', '1 100 ₽', '2 000 ₽', false, 6),
    ('Масло расторопши', 'Для печени и ЖКТ, без горечи', '450 ₽', '950 ₽', '1 750 ₽', true, 7),
    ('Рыжиковое масло', 'Старинный русский рецепт', '300 ₽', '600 ₽', '1 100 ₽', true, 8)
ON CONFLICT DO NOTHING;

INSERT INTO public.market_status (id, status, hours, next_press, announcement, show_badge)
VALUES (1, 'open', 'Вторник – Воскресенье: 9:00–19:00 (Пн — выходной)', 'Сегодня в 14:00 и 17:30', 'Сегодня в прессе: сыродавленный чёрный тмин свежей партии (Эфиопия)', true)
ON CONFLICT (id) DO UPDATE SET updated_at = NOW();

INSERT INTO public.contacts_seo (id, phone, telegram, address, location_hint, seo_title, seo_description)
VALUES (1, '+7 (921) 123-45-67', '@magiyamasel_kld', 'Калининград, ул. Черняховского, 15 (Центральный рынок)', 'Павильон молочных продуктов, центральный проход, место 12', 'Магия Масел — Попробуйте живое масло холодного отжима | Калининград', 'Попробуйте живое масло холодного отжима. Отжимаем при вас из цельного семени и ореха на Центральном рынке Калининграда, 9:00–19:00.')
ON CONFLICT (id) DO UPDATE SET updated_at = NOW();

-- ==============================================================================
-- STORAGE: Корзина для фотографий витрины
-- ==============================================================================
INSERT INTO storage.buckets (id, name, public) 
VALUES ('product-photos', 'product-photos', true)
ON CONFLICT (id) DO NOTHING;

CREATE POLICY "Public read product-photos" ON storage.objects FOR SELECT USING (bucket_id = 'product-photos');
CREATE POLICY "Admin upload product-photos" ON storage.objects FOR INSERT WITH CHECK (bucket_id = 'product-photos' AND auth.role() = 'authenticated');
