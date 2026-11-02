# Telegram Mini App – Pic/Video Gallery (100% free)

**Stack:** GitHub Pages (hosting) + Supabase free (database, file storage, admin login) + Telegram Bot (BotFather).

- `index.html` → user der mini app (photo/video grid, viewer)
- `admin.html` → admin panel (login, multi upload, delete)
- `config.js` → Supabase URL/key
- `supabase.sql` → database + storage setup

## Step 1: Supabase setup (5 min)
1. https://supabase.com e account khulo → **New project** (free plan).
2. **SQL Editor** → `supabase.sql` er puro content paste kore **Run**.
3. **Project Settings → API** theke `Project URL` ar `anon public key` copy kore `config.js` e boshao.
4. **Authentication → Users → Add user** → tomar admin email + password dao (Auto Confirm tick).
5. **Authentication → Sign In / Providers (Settings)** → **"Allow new users to sign up" OFF** koro. (Na korle je keu account khule upload korte parbe!)

## Step 2: GitHub Pages
1. GitHub e notun repo banao (e.g. `tg-gallery`), ei sob file upload koro.
2. **Settings → Pages** → Source: `Deploy from a branch` → `main` / `(root)` → Save.
3. Kichukkhon pore link pabe: `https://USERNAME.github.io/tg-gallery/`
   - Mini app: `.../index.html`
   - Admin: `.../admin.html`

## Step 3: Telegram bot
1. Telegram e **@BotFather** → `/newbot` → bot banao.
2. `/newapp` (bot select kore) → URL e `https://USERNAME.github.io/tg-gallery/` dao.
   - Othoba: `/mybots` → Bot → **Bot Settings → Menu Button → Configure** → ei URL dao.
3. Bot khule menu button/app link e click korlei gallery khulbe.

## Admin kibhabe use korbe
Browser e `https://USERNAME.github.io/tg-gallery/admin.html` kholo → login → file select → Upload. Delete o ekhan theke.

## Free plan limits
- Storage 1 GB, bandwidth ~5 GB/month (Supabase free).
- Ek file max 50 MB.
- Beshi lagle: Cloudinary / Cloudflare R2 free tier use kora jay, ba Supabase Pro.
- Project 1 shoptaho inactive thakle Supabase pause kore dey (dashboard theke resume kora jay).

## Note
- `anon key` public thakle problem nai – RLS policy te shudhu admin write korte pare.
- Private/restricted content chaile: bot er `initData` verify kore access limit korte hobe (alada backend lagbe). Bolo, ota o jog kore dibo.
