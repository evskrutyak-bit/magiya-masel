/**
 * Supabase Client Bridge для сайта «Магия Масел»
 * Курс: «Claude Code: сайт от дизайна до CMS» — Модуль 4, Урок 13
 * 
 * Работает в двух режимах:
 * 1. LIVE SUPABASE: если указаны URL и anon key -> реальная синхронизация с облачной базой Postgres.
 * 2. HYBRID MOCK: если ключи не заданы -> прозрачный fallback в localStorage без ошибок.
 */

const SupabaseBridge = {
  // Ключи по умолчанию (можно перезаписать из админки или .env)
  configKey: "magiya_masel_supabase_config",

  getConfig() {
    const saved = localStorage.getItem(this.configKey);
    if (saved) {
      try { return JSON.parse(saved); } catch (e) {}
    }
    return {
      url: "",
      anonKey: "",
      connected: false
    };
  },

  setConfig(url, anonKey) {
    const cleanUrl = (url || "").trim().replace(/\/+$/, "");
    const cleanKey = (anonKey || "").trim();
    const config = {
      url: cleanUrl,
      anonKey: cleanKey,
      connected: !!(cleanUrl && cleanKey)
    };
    localStorage.setItem(this.configKey, JSON.stringify(config));
    return config;
  },

  isConfigured() {
    const cfg = this.getConfig();
    return !!(cfg.url && cfg.anonKey && cfg.url.startsWith("http"));
  },

  async testConnection(url, key) {
    const targetUrl = (url || this.getConfig().url).trim().replace(/\/+$/, "");
    const targetKey = (key || this.getConfig().anonKey).trim();

    if (!targetUrl || !targetKey) {
      return { success: false, message: "URL или Anon Key не указаны" };
    }

    try {
      const res = await fetch(`${targetUrl}/rest/v1/oils?select=id&limit=1`, {
        headers: {
          "apikey": targetKey,
          "Authorization": `Bearer ${targetKey}`
        }
      });

      if (res.ok) {
        return { success: true, message: "Связь с базой Supabase успешно установлена!" };
      } else {
        const errText = await res.text();
        return { success: false, message: `Ошибка Supabase: ${res.status} ${errText}` };
      }
    } catch (e) {
      return { success: false, message: `Сетевая ошибка: ${e.message}` };
    }
  },

  // Загрузка витрины из базы (или fallback)
  async fetchOils(fallbackData) {
    if (!this.isConfigured()) return fallbackData;

    try {
      const cfg = this.getConfig();
      const res = await fetch(`${cfg.url}/rest/v1/oils?select=*&order=sort_order.asc`, {
        headers: {
          "apikey": cfg.anonKey,
          "Authorization": `Bearer ${cfg.anonKey}`
        }
      });
      if (res.ok) {
        const rows = await res.json();
        if (rows && rows.length > 0) {
          return rows.map(r => ({
            id: r.id,
            name: r.name,
            sub: r.sub,
            p100: r.p100,
            p250: r.p250,
            p500: r.p500,
            inStock: r.in_stock
          }));
        }
      }
    } catch (e) {
      console.warn("Supabase fetch failed, falling back to local:", e);
    }
    return fallbackData;
  },

  // Сохранение масел в базу
  async saveOils(oils) {
    if (!this.isConfigured()) return false;

    try {
      const cfg = this.getConfig();
      const payload = oils.map((o, idx) => ({
        id: o.id > 1000000000 ? undefined : o.id, // если временный id, генерируем заново
        name: o.name,
        sub: o.sub,
        p100: o.p100,
        p250: o.p250,
        p500: o.p500,
        in_stock: o.inStock,
        sort_order: idx + 1,
        updated_at: new Date().toISOString()
      }));

      const res = await fetch(`${cfg.url}/rest/v1/oils`, {
        method: "POST",
        headers: {
          "apikey": cfg.anonKey,
          "Authorization": `Bearer ${cfg.anonKey}`,
          "Content-Type": "application/json",
          "Prefer": "resolution=merge-duplicates"
        },
        body: JSON.stringify(payload)
      });
      return res.ok;
    } catch (e) {
      console.error("Supabase saveOils error:", e);
      return false;
    }
  }
};

window.SupabaseBridge = SupabaseBridge;
