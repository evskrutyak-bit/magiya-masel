(function() {
  if (localStorage.getItem('mm_cookie_consent') === '1') return;

  const banner = document.createElement('div');
  banner.id = 'mm-cookie-banner';
  banner.innerHTML = `
    <div style="max-width:1100px;margin:0 auto;display:flex;align-items:center;justify-content:space-between;gap:20px;flex-wrap:wrap;">
      <div style="font-size:14px;line-height:1.5;color:#F1EEE2;flex:1 1 300px;">
        🍪 Мы используем cookies и анонимную аналитику (Яндекс.Метрика) для улучшения скорости и удобства сайта. 
        <a href="/privacy.html" style="color:#E5A33C;text-decoration:underline;margin-left:4px;">Политика конфиденциальности</a>
      </div>
      <button id="mm-cookie-accept" style="background:#E5A33C;color:#1A1208;border:none;padding:10px 22px;border-radius:4px;font-weight:700;font-size:14px;cursor:pointer;white-space:nowrap;transition:filter 0.2s;">
        Понятно
      </button>
    </div>
  `;

  Object.assign(banner.style, {
    position: 'fixed',
    bottom: '0',
    left: '0',
    right: '0',
    background: '#161d12',
    borderTop: '1px solid rgba(229, 163, 60, 0.4)',
    boxShadow: '0 -4px 20px rgba(0,0,0,0.5)',
    padding: '16px 24px',
    zIndex: '99999',
    fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
    transition: 'opacity 0.3s ease, transform 0.3s ease',
    opacity: '0',
    transform: 'translateY(20px)'
  });

  document.addEventListener('DOMContentLoaded', function() {
    document.body.appendChild(banner);
    setTimeout(() => {
      banner.style.opacity = '1';
      banner.style.transform = 'translateY(0)';
    }, 100);

    const btn = document.getElementById('mm-cookie-accept');
    if (btn) {
      btn.addEventListener('click', function() {
        localStorage.setItem('mm_cookie_consent', '1');
        banner.style.opacity = '0';
        banner.style.transform = 'translateY(20px)';
        setTimeout(() => banner.remove(), 300);
      });
      btn.addEventListener('mouseenter', () => btn.style.filter = 'brightness(1.1)');
      btn.addEventListener('mouseleave', () => btn.style.filter = 'none');
    }
  });
})();
